---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest collect_quest_lv94  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 94  begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then
				target.vid("__TARGET__", v, "Seon-Pyeong")
			end
                   send_letter("&Lv 94 - Cercetarile lui Seon-Pyeong")
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
            say_verde("Momentan studiez bijuteriile intelepciune")
            say_verde("si am nevoie de 20 de exemplare bune.") 
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --quest potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
              send_letter("&Lv 94 - Cercetarile lui Seon-Pyeong")
              q.set_icon("scroll_open_green.tga")
			
		end
		when button or info begin
            say_title("Cercetarile lui Seon-Pyeong")
            ---                                                   l
            say_verde("")
            say_verde("Seon-Pyeong tocmai cerceteaza bijuteriile")
            say_verde("intelepciune. Acestea pot fi obtinute de la")
            say_verde("armata setou din lumea de jos.")
			say_item_vnum(30252) 
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
                    if pc.count_item(30252)==0 then
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

		when 2402.kill or
			 2404.kill  begin
			local s = number(1, 200)
			if s <= 1  then
				pc.give_item2(30252, 1)
			end	
		end

		
    	when 20091.chat."Ai bijuterie intelepciune?" with pc.count_item(30252) >0   begin
			if get_time() > pc.getqf("duration") then
				if  pc.count_item(30252) >0 then
				say_title("Seon-Pyeong")
	            say_verde("")
	            say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(30252, 1)
				-- pc.setqf("duration",get_time()+2) -- 2 secunde [Testing]
				pc.setqf("duration",get_time()+60*60*5) -- 5 ore
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=15
				else		
					pass_percent=50
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 19 then     --Less than 20 
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)     
						say_title("Seon-Pyeong:")
                       	say_verde("")
                        say_verde("Acest exemplar este excelent, multumesc.")
						say_reward("Mai am nevoie de "..20-pc.getqf("collect_count").. " bijuterii!")
						pc.setqf("drink_drug",0)	 --Potion reset

						return
					end
					while true do
						say_title("Seon-Pyeong:")
			            say_verde("")
			            say_verde("Acum studiile mele privind bijuteriile sunt")
			            say_verde("finalizate, multumesc pentru ajutorul tau.")
			            say_verde("")
			            say_reward("Alege o recompensa:")
						s2 = select("+1100 PV","+140 Aparare","+60 Valoarea atacului")
						if 1== s2 then
							if pc.getf("collect_quest_lv92","block_id") == 1 then
								say_title("Seon-Pyeong:")
					            say_verde("")
					            say_reward("Nu poti alege aceeasi recompensa pe")
					            say_reward("care ai ales-o data trecuta.")
								wait()
							else
								affect.add_collect(1, 1100, 60*60*24*365*60) -- 60 ani 
								pc.setf("collect_quest_lv94","block_id",1)
								break
							end
						elseif 2== s2 then
							if pc.getf("collect_quest_lv92","block_id") == 2 then
								say_title("Seon-Pyeong:")
					            say_verde("")
					            say_reward("Nu poti alege aceeasi recompensa pe")
					            say_reward("care ai ales-o data trecuta.")
								wait()
							else
								affect.add_collect(apply.DEF_GRADE_BONUS, 140, 60*60*24*365*60) -- 60 ani
								pc.setf("collect_quest_lv94","block_id",2)
								break
							end
						else 
							if pc.getf("collect_quest_lv92","block_id") == 3 then
								say_title("Seon-Pyeong:")
					            say_verde("")
					            say_reward("Nu poti alege aceeasi recompensa pe")
					            say_reward("care ai ales-o data trecuta.")
								wait()
							else
								affect.add_collect(apply.ATT_GRADE_BONUS,60,60*60*24*365*60)-- 60 ani
								pc.setf("collect_quest_lv94","block_id",3)
								break
							end
						end
					end
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					clear_letter()
					set_state(__complete2__)
					return
				else								
				say_title("Seon-Pyeong:")
                say_verde("")
                say_reward("Acest exemplar este putred, imi pare rau.")		   
				pc.setqf("drink_drug",0)	 --Potion reset
				return
				end
				else
					say_title("Seon-Pyeong:")
					say_verde("")
					say_reward("Vin-o la mine cand ai bijuterie intelepciune.")
					return
				end
		  else
		  say_title("Seon-Pyeong:")
		  say_verde("")
		  say_reward("Studiile inca nu s-au terminat, imi pare rau.")
		  return
		end

	end
	end
	state __complete begin
	end
	state __complete2__ begin
	end
end