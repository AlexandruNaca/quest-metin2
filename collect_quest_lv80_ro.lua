---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest collect_quest_lv80  begin
    state start begin
    end
    state run begin
        when login or levelup with pc.level >= 80  begin
            set_state(information)
        end
    end

    state information begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then
                target.vid("__TARGET__", v, "Chaegirab")
            end
                    send_letter("&Lv 80 - Cercetarile biologului")
                    q.set_icon("scroll_open_green.tga")
        end

        when button or info begin
                    say_title("Cercetarile biologului Chaegirab")
                    say_verde("")
                    say_verde("Chaegirab ar vrea sa vorbeasca cu tine.")
                    say_verde("Cauta-l si vezi daca poti sa-l ajuti.")
		end

		when __TARGET__.target.click or 20084.chat."Te rog sa ma asculti" begin
			target.delete("__TARGET__")
            say_title("Biologul Chaegirab:")
            say_verde("")
            say_verde("Am nevoie de cineva ca tine sa ma ajute cu")
            say_verde("cercetariile mele, in schimbul ajutorului")
            say_verde("oferit te voi rasplati cum se cuvine.")
            wait()
            say_title("Biologul Chaegirab:")
            say_verde("")                                                                                           
            say_verde("Momentan studiez Tabla lui Tugyi si am nevoie")
            say_verde("de 30 de exemplare care sa nu fie putrede.") 
			set_state(go_to_disciple)
			pc.setqf("duration",0)  
			pc.setqf("collect_count",0)
			pc.setqf("drink_drug",0)
		end
	end
			
	state go_to_disciple begin
		when letter begin
                send_letter("&Lv 80 - Cercetarile biologului")
                q.set_icon("scroll_open_green.tga")
		end
					
		when button or info begin
                        say_title("Cercetarile biologului")
                        ---                                                   l
                        say_verde("")
                        say_verde("Chaegirab student al invatatorului Uriel")
                        say_verde("tocmai cerceteaza Tabla lui Tugyi.")
                        say_verde("")
						say_item_vnum(30166)
						say_reward("Pana acum ai colectat "..pc.getqf("collect_count").." Table.")
		end

                when 71035.use begin 
                    if get_time() < pc.getqf("duration") then
                        say_title("Cercetarile biologului")
                        say_verde("")
                        say_verde("A fost folosit 1 data.")
                        return
                    end
                    if pc.getqf("drink_drug")==1 then
                        say_title("Cercetarile biologului")
                        say_verde("")
                        say_verde("A fost folosit 1 data.")
						return
                    end
                    if pc.count_item(30166)==0 then
                        say_title("Cercetarile biologului")
                        say_verde("")
                        say_verde("A fost folosit 1 data.")
						return
                    end
                    item.remove()
                    pc.setqf("drink_drug",1)
                end
		
		when 70030.use begin
			if get_time() > pc.getqf("redm_duration") then
				pc.setqf("monocles_used", 0)
			end
			if get_time() > pc.getqf("duration") then
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
				return
			end
			if pc.getqf("monocles_used") > 2 then
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
				return
			end
			if pc.getqf("monocles_used") == 0 then
				pc.setqf("redm_duration", get_time()+16*60*60)
			end
			item.remove()
			pc.setqf("duration", get_time()-1)
			local use = pc.getqf("monocles_used")+1
			pc.setqf("monocles_used",use)
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
		end

		when 1401.kill or
			 1402.kill or
			 1403.kill or
			 1601.kill or 
			 1602.kill or
			 1603.kill  begin
			local s = number(1, 100)
			if s <= 5 then
				pc.give_item2(30166, 1)
			end	
		end

		when 20084.chat."Ai tabla lui tugyi?" with pc.count_item(30166) >0 begin
			if get_time() > pc.getqf("duration") then
                say_title("Biologul Chaegirab:")
                say_verde("")
                say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(30166, 1)
				-- pc.setqf("duration",get_time()+2) -- 2 secunde [Testing]
				pc.setqf("duration",get_time()+60*60*5) -- 5 ore
				wait()
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
					else
					pass_percent=90
				end
				local s= number(1,100)
				if s<= pass_percent  then
					if pc.getqf("collect_count")< 29 then     --weniger als 30
						local index =pc.getqf("collect_count")+1
						pc.setqf("collect_count",index)                                                     
                        say_title("Biologul Chaegirab:")
                        say_verde("")
                        say_verde("Acest exemplar este excelent, multumesc.")
						say_reward("Mai am nevoie de "..30-pc.getqf("collect_count").. " table.")
						pc.setqf("drink_drug",0)                                                         
						return
					end
					---                                                   l
                    say_title("Biologul Chaegirab:")
                    say_verde("")
                    say_verde("Ai colectat toate tablele, insa mai am")
                    say_verde("nevoie de P. sufletului lui Tugyi. Trebuie")
                    say_verde("sa invingi uriasii din campul cu serpi.")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)
					pc.setqf("duration",0)
					set_state(key_item)
					return
				else
                    say_title("Biologul Chaegirab:")
                    say_verde("")
                    say_reward("Acest exemplar este putred, imi pare rau.")
					pc.setqf("drink_drug",0)                                         
					return
				end
			else
                say_title("Biologul Chaegirab:")
                say_verde("")
				local hoursleft = (pc.getqf("duration")-get_time())*60*60
				if hoursleft > 12 then
				say_reward("Studiile inca nu s-au terminat, imi pare rau.")
				elseif hoursleft < 1 then
				say_reward("Studiile inca nu s-au terminat, imi pare rau.")
				else
				say_reward("Studiile inca nu s-au terminat, imi pare rau.")
				end
				return
			end
		end
	end
	
	state key_item begin
		when letter begin
                send_letter("&Lv 80 - Cercetarile biologului")
                q.set_icon("scroll_open_green.tga")
			if pc.count_item(30225)>0 then
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Biologul Chaegirab")
				end
			end
		end
					
		when button or info begin
			if pc.count_item(30225) >0 then
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai facut rost de P. sufletului lui Tugyi,")
                    say_verde("dute la Chaegirab pentru a o studia.")
				return
			end
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Obtine P. sufletului lui Tugyi omorand")
                    say_verde("cativa dintre uriasii din campul cu serpi.")
					say_item_vnum(30225)
		end

		when 1401.kill or
			 1402.kill or
			 1403.kill or
			 1601.kill or 
			 1602.kill or
			 1603.kill  begin
			local s = number(1, 200)
			if s == 1 and pc.count_item(30225)==0 then
				pc.give_item2(30225, 1)
                    send_letter("&Lv 80 - Ai obtinut P. sufletului")    
                    q.set_icon("scroll_open_green.tga")
			end
		end

		when __TARGET__.target.click  or 20084.chat."P. sufletului lui Tugyi" with pc.count_item(30225) > 0  begin
			target.delete("__TARGET__")
            say_title("Biologul Chaegirab:")
            say_verde("")
            say_verde("Acum studiile mele privind tablele sunt")
            say_verde("finalizate, multumesc pentru ajutorul tau.")
            say_verde("Pleaca, acum te asteapta doctorul Baek-Go.")
			pc.remove_item(30225,1)
			set_state(__reward)
		end
	end

	state __reward begin
		when letter begin
                send_letter("&Lv 80 - Du-te la Baek-Go")
                q.set_icon("scroll_open_green.tga")
			local v = find_npc_by_vnum(20018)
			if v != 0 then
				target.vid("__TARGET__", v, "Du-te la Baek-Go")
			end
		end
		
		when button or info begin
            say_title("Biologului Chaegirab")
            say_verde("")
            say_verde("Doctorul Baek-Go te asteapta in sat, el vrea sa")
            say_verde("vorbeasca cu tine si sa te rasplateasca pentru")
            say_verde("ajutorul oferit studentului sau Chaegirab.")
		end

		when __TARGET__.target.click or 20018.chat."Cercetariile biologului" begin
			target.delete("__TARGET__")
            say_verde("Baek-Go:")
            say_verde("")
            say_verde("Biologul Chaegirab te-a trimis cu aceasta reteta")
            say_verde("la mine? In sfarsit a terminat cu cercetariile.")
            say_verde("")
            say_reward("Recompensa:")
            say_reward("Bonus permanent: +6% Viteza de atac")
            say_reward("Bonus permanent: +10% Valoarea atacului")
			affect.add_collect(apply.ATT_SPEED,6,60*60*24*365*60) --60 ani
			affect.add_collect_point(POINT_ATT_BONUS,10,60*60*24*365*60) --60 ani
			clear_letter()
			set_quest_state("collect_quest_lv85", "run")
			set_state(__complete)
		end
	end

	state __complete begin
	end
end