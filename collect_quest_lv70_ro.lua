---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest collect_quest_lv70  begin
        state start begin
        end
        state run begin
                when login or levelup with pc.level >= 70  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20084)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Chaegirab")
                        end
                    send_letter("&Lv 70 - Cercetarile biologului")
                    q.set_icon("scroll_open_green.tga")
                end

                when button or info begin
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
                        say_verde("oferit te voi rasplati cu diferite obiecte.")
                        wait()
                        say_title("Biologul Chaegirab:")
                        say_verde("")                                                                                           
                        say_verde("Momentan studiez Crengile Zelkova si am nevoie")
                        say_verde("de 25 de exemplare care sa nu fie putrede.") 
                        set_state(go_to_disciple)
                        pc.setqf("duration",0)  
						pc.setqf("collect_count",0)
                        pc.setqf("drink_drug",0) 
                        end
        end

        state go_to_disciple begin
                when letter begin
                        send_letter("&Lv 70 - Cercetarile biologului")
                        q.set_icon("scroll_open_green.tga")
                end
                when button or info begin
                        say_title("Cercetarile biologului")
                        ---                                                   l
                        say_verde("")
                        say_verde("Chaegirab student al invatatorului Uriel")
                        say_verde("tocmai cerceteaza Crengile zelkova.")
                        say_verde("")
                        say_item_vnum(30165)
                        say_reward("Pana acum ai colectat "..pc.getqf("collect_count").." Crengi.")
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
                    if pc.count_item(30165)==0 then
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
				
		when 2301.kill or 
			 2302.kill or
			 2303.kill or
			 2304.kill or
			 2305.kill begin
			local s = number(1, 200)
			if s == 1 then
				pc.give_item2(30165)
			end	
		end

		when 20084.chat."GM: Cercetarile biologului" with pc.count_item(30165) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
            say_title("Cercetarile biologului")
            say_verde("")
            say_verde("Ai eliminat limita de timp.")
			pc.setqf("duration", get_time()-1)
			return
		end
         	when 20084.chat."Ai creanga zelkova?" with pc.count_item(30165) >0   begin
                        if get_time() > pc.getqf("duration") then
                                say_title("Biologul Chaegirab:")
                                say_verde("")
                                say_verde("Dami cateva momente sa studiez acest exemplar.")
                                pc.remove_item(30165, 1)
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
                                	if pc.getqf("collect_count")< 24 then                                                     
			           local index =pc.getqf("collect_count")+1
                               		pc.setqf("collect_count",index)     
                                    say_title("Biologul Chaegirab:")
                                    say_verde("")
                                    say_verde("Acest exemplar este excelent, multumesc.")
            						say_reward("Mai am nevoie de "..25-pc.getqf("collect_count").. " crengi zelkova!")
            						pc.setqf("drink_drug",0)        
						return
                                        end
                                        say_title("Biologul Chaegirab:")
                                        say_verde("")
                                        say_verde("Ai colectat toate crengile zelkova, insa mai")
                                        say_verde("am nevoie de Piatra Spiritului Gyimok. Trebuie")
                                        say_verde("sa invingi copacii din padurea fantoma.")
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
                    send_letter("&Lv 70 - Cercetarile biologului")
                    q.set_icon("scroll_open_green.tga")

                        if pc.count_item(30224)>0 then
                                local v = find_npc_by_vnum(20084)
                                if v != 0 then
                                        target.vid("__TARGET__", v, "Biologul Chaegirab")
                                end
                        end

                end
                when button or info begin
                        if pc.count_item(30224) >0 then
                            say_title("Cercetarile biologului")
                            say_verde("")
                            say_verde("Ai facut rost de Piatra Spiritului Gyimok,")
                            say_verde("dute la Chaegirab pentru a o studia.")
                                return
                        end

                            say_title("Cercetarile biologului")
                            say_verde("")
                            say_verde("Obtine Piatra Spiritului Gyimok omorand")
                            say_verde("cativa dintre copacii din padurea fantoma.")
                            say_item_vnum(30224)
                end



		when 2301.kill or
			 2302.kill or
			 2303.kill or
			 2304.kill or
			 2305.kill begin 
                        local s = number(1, 400)
                        if s == 1 and pc.count_item(30224)==0 then
                                pc.give_item2(30224)
                                send_letter("&Lv 70 - Ai obtinut P. spiritului")    
                                q.set_icon("scroll_open_green.tga")
                        end
                end



                when __TARGET__.target.click  or
                        20084.chat."Piatra Spiritului Gyimok" with pc.count_item(30224) > 0  begin
                    target.delete("__TARGET__")
                        say_title("Biologul Chaegirab:")
                        say_verde("")
                        say_verde("Acum studiile mele privind crengile zelkova")
                        say_verde("sunt finalizate, multumesc pentru ajutorul tau.")
                        say_verde("Pleaca, acum te asteapta doctorul Baek-Go.")
                        pc.remove_item(30224,1)
                        set_state(__reward)
                end

        end

        state __reward begin
                when letter begin
                        send_letter("&Lv 70 - Du-te la Baek-Go")
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

                when __TARGET__.target.click  or
                        20018.chat."Cercetariile biologului"  begin
                        target.delete("__TARGET__")
                        say_verde("Baek-Go:")
                        say_verde("")
                        say_verde("Biologul Chaegirab te-a trimis cu aceasta reteta")
                        say_verde("la mine? In sfarsit a terminat cu cercetariile.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("Bonus permanent: +10% Viteza de miscare")
                        say_reward("Bonus permanent: -10% Pagube de la mobi")
            			affect.add_collect(apply.MOV_SPEED,10,60*60*24*365*60)	
            			affect.add_collect_point(POINT_DEF_BONUS,10,60*60*24*365*60) --60 ani	
                        clear_letter()
                        set_quest_state("collect_quest_lv80", "run")
                        set_state(__complete)
                end

        end


        state __complete begin
        end
end