---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest collect_quest_lv92  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 92  begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then
				target.vid("__TARGET__", v, "Seon-Pyeong")
			end
                   send_letter("&Lv 92 - Cercetarile lui Seon-Pyeong")
                   q.set_icon("scroll_open_green.tga")
		end

		when button or info begin
                say_title("Cercetarile lui Seon-Pyeong")
                say_verde("")
                say_verde("Seon-Pyeong ar vrea sa vorbeasca cu tine.")
                say_verde("Cauta-l si vezi daca poti sa-l ajuti.")
		end
		
		when __TARGET__.target.click or
			20091.chat."Te rog sa ma asculti" begin
			target.delete("__TARGET__")
			---                                                   l
			say_title("Seon-Pyeong:")
            say_verde("")
            say_verde("Am nevoie de cineva ca tine sa ma ajute cu")
            say_verde("cercetariile mele, in schimbul ajutorului")
            say_verde("oferit te voi rasplati cum se cuvine.")
            wait()
            say_title("Seon-Pyeong:")
            say_verde("")                                                                                           
            say_verde("Momentan studiez bijuteriile rea vointa si")
            say_verde("am nevoie de 10 de exemplare bune.") 
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --Quest Potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
              send_letter("&Lv 92 - Cercetarile lui Seon-Pyeong")
              q.set_icon("scroll_open_green.tga")
			
		end
		when button or info begin
            say_title("Cercetarile lui Seon-Pyeong")
            ---                                                   l
            say_verde("")
            say_verde("Seon-Pyeong tocmai cerceteaza bijuteriile")
            say_verde("rea vointa. Acestea pot fi obtinute de la")
            say_verde("creaturile de gheata din lumea de jos.")
			say_item_vnum(30251) 
			say_reward("Pana acum ai colectat "..pc.getqf("collect_count").." bijuterii.")
		end
		
                when 71035.use begin 
                    if get_time() < pc.getqf("duration") then
                        say_title("Cercetarile lui Seon-Pyeong")
                        say_verde("")
                        say_verde("A fost folosit 1 data.")
                        return
                    end
                    if pc.getqf("drink_drug")==1 then
                        say_title("Cercetarile lui Seon-Pyeong")
                        say_verde("")
                        say_verde("A fost folosit 1 data.")
						return
                    end
                    if pc.count_item(30251)==0 then
                        say_title("Cercetarile lui Seon-Pyeong")
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
                    say_title("Cercetarile lui Seon-Pyeong")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
				return
			end
			if pc.getqf("monocles_used") > 2 then
                    say_title("Cercetarile lui Seon-Pyeong")
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
                    say_title("Cercetarile lui Seon-Pyeong")
                    say_verde("")
                    say_verde("Ai eliminat limita de timp.")
		end

		when 1135.kill or 1137.kill begin
			local s = number(1, 150)
			if s <= 1  then
				pc.give_item2(30251, 1)
			end	
		end

    	when 20091.chat."Ai bijuterie rea vointa?" with pc.count_item(30251) >0   begin
			if get_time() < pc.getqf("duration") then
			  say_title("Seon-Pyeong:")
			  say("")
			  say_reward("Studiile inca nu s-au terminat, imi pare rau.")
				return
			end
			
			if pc.count_item(30251) <= 0 then
					say_title("Seon-Pyeong:")
					say("")
					say("Vin-o la mine cand ai bijuterie rea vointa.")
					return
				end
				say_title("Seon-Pyeong:")
	            say_verde("")
	            say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(30251, 1)
				-- pc.setqf("duration",get_time()+2) -- 2 secunde [Testing]
				pc.setqf("duration",get_time()+60*60*5) -- 5 ore
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent = 15
				else		
					pass_percent = 60
				end
				local s= number(1,100)

				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 9 then     --less than 10
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)
						say_title("Seon-Pyeong:")
                       	say_verde("")
                        say_verde("Acest exemplar este excelent, multumesc.")
						say_reward("Mai am nevoie de "..10-pc.getqf("collect_count").. " bijuterii!")
						pc.setqf("drink_drug",0)	 --Potion reset
					else
					pc.setqf("duration", 0) 
					say_title("Seon-Pyeong:")
		            say_verde("")
		            say_verde("Acum studiile mele privind bijuteriile sunt")
		            say_verde("finalizate, multumesc pentru ajutorul tau.")
		            say("")
		            say_reward("Alege o recompensa:")
					pc.setqf("collect_count",10)
					local s=select("+1000 PV","+120 Aparare","+50 Valoarea atacului")
					if 1 == s then
						affect.add_collect(1, 1000, 60*60*24*365*60) --60 ani 
						pc.setqf("block_id",1)
					elseif 2 == s then
						affect.add_collect(apply.DEF_GRADE_BONUS, 120, 60*60*24*365*60) --60 ani 
						pc.setqf("block_id",2)
					elseif 3 == s then
						affect.add_collect(apply.ATT_GRADE_BONUS,50,60*60*24*365*60) --60 ani		
						pc.setqf("block_id",3)
				    end
					clear_letter()
					set_quest_state("collect_quest_lv94", "run")
					set_state(__complete2__)
					end
					return
				else								
					pc.setqf("drink_drug",0)	 --Potion reset
					say("Seon-Pyeong:")
                    say_verde("")
                    say_reward("Acest exemplar este putred, imi pare rau.")	   
					return
				end
	end
end
	
	state __complete begin
	end
	state __complete2__ begin
	end
end