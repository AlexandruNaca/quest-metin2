---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest collect_quest_lv85  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 85  begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then
				target.vid("__TARGET__", v, "Chaegirab")
			end
                   send_letter("&Lv 85 - Cercetarile biologului")
                   q.set_icon("scroll_open_green.tga")
		end

		when button or info begin
			----"12345678901234567890123456789012345678901234567890"|
                say_title("Cercetarile biologului Chaegirab")
                say_verde("")
                say_verde("Chaegirab ar vrea sa vorbeasca cu tine.")
                say_verde("Cauta-l si vezi daca poti sa-l ajuti.")
		end
		
		when __TARGET__.target.click or
			20084.chat."Te rog sa ma asculti" begin
			target.delete("__TARGET__")
            say_title("Biologul Chaegirab:")
            say_verde("")
            say_verde("Am nevoie de cineva ca tine sa ma ajute cu")
            say_verde("cercetariile mele, in schimbul ajutorului")
            say_verde("oferit te voi rasplati cum se cuvine.")
            wait()
            say_title("Biologul Chaegirab:")
            say_verde("")                                                                                           
            say_verde("Momentan studiez Ramurile Rosii si am nevoie")
            say_verde("de 40 de exemplare care sa nu fie putrede.") 																																				  
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --quest potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
              send_letter("&Lv 85 - Cercetarile biologului")
              q.set_icon("scroll_open_green.tga")
			
		end
		when button or info begin
                        say_title("Cercetarile biologului")
                        ---                                                   l
                        say_verde("")
                        say_verde("Chaegirab student al invatatorului Uriel")
                        say_verde("tocmai cerceteaza Ramurile Rosii.")
                        say_verde("")
						say_item_vnum(30167) 
						say_reward("Pana acum ai colectat "..pc.getqf("collect_count").." ramuri rosii.")
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
                    if pc.count_item(30167)==0 then
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
				pc.setqf("redm_duration", get_time()+24*60*60)
			end
			item.remove()
			pc.setqf("duration", get_time()-1)
			local use = pc.getqf("monocles_used")+1
			pc.setqf("monocles_used",use)
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
		end
		
		when 2311.kill 
			or 2312.kill 
			or 2313.kill 
			or 2314.kill 
			or 2315.kill begin 
			local s = number(1, 200)
			if s == 1  then
				pc.give_item2(30167)
			end	
		end
		
    	when 20084.chat."Ai ramura rosie?" with pc.count_item(30167) >0   begin
			if get_time() > pc.getqf("duration") then
                say_title("Biologul Chaegirab:")
                say_verde("")
                say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(30167, 1)
				-- pc.setqf("duration",get_time()+2) -- 2 secunde [Testing]
				pc.setqf("duration",get_time()+60*60*5) -- 5 ore
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
				else		
					pass_percent=95
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 39 then     --Less than 40 
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)
                        say_title("Biologul Chaegirab:")
                        say_verde("")
                        say_verde("Acest exemplar este excelent, multumesc.")
						say_reward("Mai am nevoie de "..40-pc.getqf("collect_count").. " ramuri rosi!")
						pc.setqf("drink_drug",0)	 --Potion reset
						return
					end
                    say_title("Biologul Chaegirab:")
                    say_verde("")
                    say_verde("Ai colectat toate ramurele, insa mai am")
                    say_verde("nevoie de P. Sufl. padurea spirit. Trebuie")
                    say_verde("sa invingi copacii din padurea rosie.")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					set_state(key_item)
					return
				else								
                    say_title("Biologul Chaegirab:")
                    say_verde("")
                    say_reward("Acest exemplar este putred, imi pare rau.")
					pc.setqf("drink_drug",0)	 --Reset potion
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
                send_letter("&Lv 85 - Cercetarile biologului")
                q.set_icon("scroll_open_green.tga")
			
			if pc.count_item(30226)>0 then	
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Biologul Chaegirab")
				end
			end

		end
		when button or info begin
			if pc.count_item(30226) >0 then
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Ai facut rost de P. Sufl. padurea spirit,")
                    say_verde("dute la Chaegirab pentru a o studia.")
				return
			end
                    say_title("Cercetarile biologului")
                    say_verde("")
                    say_verde("Obtine P. Sufl. padurea spirit omorand")
                    say_verde("cativa dintre copacii din padurea rosie.")
					say_item_vnum(30226)
		end
		

	
		when 2311.kill or
			2312.kill or
			2313.kill or
			2314.kill or
			2315.kill  begin
			local s = number(1, 500)
			if s == 1 and pc.count_item(30226)==0 then
				pc.give_item2(30226)
                    send_letter("&Lv 85 - Ai obtinut P. sufletului")    
                    q.set_icon("scroll_open_green.tga")		
			end	
		end


		
		when __TARGET__.target.click  or
			20084.chat."P. Sufl. padurea spirit" with pc.count_item(30226) > 0  begin
		    target.delete("__TARGET__")
            say_title("Biologul Chaegirab:")
            say_verde("")
            say_verde("Acum studiile mele privind ramurile sunt")
            say_verde("finalizate, multumesc pentru ajutorul tau.")
            say_verde("Pleaca, acum te asteapta doctorul Baek-Go.")
			pc.remove_item(30226,1)
			set_state(__reward)
		end
	end
	
	state __reward begin
		when letter begin
                send_letter("&Lv 85 - Du-te la Baek-Go")
                q.set_icon("scroll_open_green.tga")
			
			local v = find_npc_by_vnum(20018)
			if v != 0 then
				target.vid("__TARGET__", v, "Du-te la Baek-go")
			end
		end
		when button or info begin
            say_title("Biologului Chaegirab")
            say_verde("")
            say_verde("Doctorul Baek-Go te asteapta in sat, el vrea sa")
            say_verde("vorbeasca cu tine si sa te rasplateasca pentru")
            say_verde("ajutorul oferit studentului sau Chaegirab.")
		end
		
		when __TARGET__.target.click  or
			20018.chat."Cercetariile biologului" begin
		    target.delete("__TARGET__")
            say_verde("Baek-Go:")
            say_verde("")
            say_verde("Biologul Chaegirab te-a trimis cu aceasta reteta")
            say_verde("la mine? In sfarsit a terminat cu cercetariile.")
            say_verde("")
            say_reward("Recompensa:")
            say_reward("Bonus permanent: +10% Rezistenta tuturor raselor")
			clear_letter()
			affect.add_collect_point(POINT_RESIST_WARRIOR,10,60*60*24*365*60) --60 ani	
			affect.add_collect_point(POINT_RESIST_ASSASSIN,10,60*60*24*365*60) --60 ani	
			affect.add_collect_point(POINT_RESIST_SURA,10,60*60*24*365*60) --60 ani	
			affect.add_collect_point(POINT_RESIST_SHAMAN,10,60*60*24*365*60) --60 ani	
			set_quest_state("collect_quest_lv90", "run")
			set_state(__complete)
		end
	end

	state __complete begin
	end
end