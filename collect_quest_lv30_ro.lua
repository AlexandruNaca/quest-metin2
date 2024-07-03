---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest make_herb_lv30  begin
	state start begin
		when login or levelup with pc.level >= 30 and pc.level <= 99 begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then
				target.vid("__TARGET__", v, "Chaegirab")
			end
			send_letter("&Lv 30 - Cercetarile biologului")
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
			say_verde("oferit te voi rasplati cum se cuvine.")
			wait()
			say_title("Biologul Chaegirab:")
			say_verde("")																							
			say_verde("Momentan studiez Dintii de orc si am nevoie de")
			say_verde("10 exemplare care sa nu fie putrede, inteles?")	
																																  
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- you can try
			pc.setqf("collect_count",0) -- made over
			pc.setqf("drink_drug",0) -- drink the confused syrup, then a
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Lv 30 - Cercetarile biologului")
			q.set_icon("scroll_open_green.tga")
		end
		when button or info begin
            say_title("Cercetarile biologului")
			---                                                   l
			say_verde("")
			say_verde("Chaegirab student al invatatorului Uriel")
			say_verde("tocmai cerceteaza Dintii de orc.")
			say_verde("")
			say_item_vnum(30006) 
			say_reward("Pana acum ai colectat "..pc.getqf("collect_count").." Dinti.")
		end
		
		when 71035.use begin -- confused syrup
			if get_time() < pc.getqf("duration") then
				say_verde("")
				say_verde("A fost folosit 1 data.")
				return
			end
			if pc.getqf("drink_drug")==1 then
				say_verde("")
				say_verde("A fost folosit 1 data.")

				return
			end
			if pc.count_item(30006)==0 then
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_verde("Am nevoie de exemplare pentru studiile mele.")
				return
			end
			item.remove()	
			pc.setqf("drink_drug",1)
		end

		when 20084.chat."GM: Cercetarile biologului" with pc.count_item(30006) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
                say_title("Cercetarile biologului")
                say_verde("")
                say_verde("Ai eliminat limita de timp.")
			pc.setqf("duration", get_time()-1)
			return
		end
		
    	when 20084.chat."Ai Dinte de Ork ?" with pc.count_item(30006) >0   begin
			if get_time() > pc.getqf("duration") then
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(30006, 1)
                -- pc.setqf("duration",get_time()+2) -- 2 secunde [Testing]
				pc.setqf("duration",get_time()+60*60*1) -- 1 ora
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
				else		
					pass_percent=90
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 9 then     -- 10­ colectati
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)     -- colectat inca +1 
						say_title("Biologul Chaegirab:")
						say_verde("")
						say_verde("Acest exemplar este excelent, multumesc.")
						say_verde("")
						say_reward("Mai am nevoie de inca "..10-pc.getqf("collect_count").. " Dinti de Ork!")
						say_verde("")
						say_reward("Adu-mi alt exemplar intr-o ora.")
						pc.setqf("drink_drug",0)	 -- syrup initialization
						return
					end
					say_title("Biologul Chaegirab:")
					say_verde("")
					say_verde("Ai colectat toti Dintii de Ork, insa mai am")
					say_verde("nevoie de P. sufletului Jinunggyi. Trebuie sa")
					say_verde("invingi Orcii Negrii ca sa o obtii.")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					set_state(key_item)
					return
				else								
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_reward("Acest exemplar este putred, imi pare rau.")
				pc.setqf("drink_drug",0)	 -- syrup initialization
				return
				end
	    else
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_reward("Studiile inca nu s-au terminat, imi pare rau.")
		  return
		end

	end
end


	state key_item begin
		when letter begin
			send_letter("&Lv 30 - Cercetarile biologului")
			q.set_icon("scroll_open_green.tga")
			
			if pc.count_item(30220)>0 then	
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Biologul Chaegirab")
				end
			end

		end
		when button or info begin
			if pc.count_item(30220) >0 then
				say_title("Cercetarile biologului")
				say_verde("")
				say_verde("Ai facut rost de P. sufletului Jinunggyi, acum")
				say_verde("dute la Biologul Chaegirab pentru a o studia.")
				return
			end
			say_title("Cercetarile biologului")
			say_verde("")
			say_verde("Obtine P. sufletului Jinunggyi omorand")
			say_verde("cativa dintre Orcii Negri.")
			say_item_vnum(30220)
		end
		

	
		when 635.kill or                      -- Orc elita general
			 636.kill or                      -- Orc negru
			 637.kill  begin                  -- Orc negru urias
			local s = number(1, 500)
			if s == 1 and pc.count_item(30220)==0 then
				pc.give_item2(30220, 1)
				send_letter("&Lv 30 - Ai obtinut P. sufletului")	
				q.set_icon("scroll_open_green.tga")
			end	
		end
	
		when __TARGET__.target.click  or
			20084.chat."P. sufletului Jinunggyi" with pc.count_item(30220) > 0  begin
		    target.delete("__TARGET__")
			say_title("Biologul Chaegirab:")
			say_verde("")
			say_verde("Acum studiile mele privind Dintii de orc sunt")
			say_verde("finalizate, multumesc pentru ajutorul tau mare")
			say_verde("razboinic, acum te asteapta doctorul Baek-Go.")
			pc.remove_item(30220,1)
			set_state(__reward)
		end
		
	end
	
	state __reward begin
		when letter begin
			send_letter("&Lv 30 - Du-te la Baek-Go")
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
			20018.chat."Cercetariile biologului" begin
		    target.delete("__TARGET__")
			say_title("Baek-Go:")
			say_verde("")
			say_verde("Biologul Chaegirab te-a trimis cu aceasta reteta")
			say_verde("la mine? In sfarsit a terminat cu cercetariile.")
			say_verde("")
			say_reward("Recompensa:")
			say_reward("Bonus permanent: +10% Viteza de miscare ")
			affect.add_collect(apply.MOV_SPEED,10,60*60*24*365*60) --60 ani
			clear_letter()
			set_quest_state("collect_quest_lv40", "run")
			set_state(__complete)
		end
			
	end

	
	state __giveup__ begin
		when 20084.chat."Vrei sa renunti?" begin
			say_title("Biologul Chaegirab:")
			say_verde("")
			say_verde("Este destul de greu, stiu si eu dar nu e")
			say_verde("loc de persoane lase care renunta.")
	     end
	 end
	state __complete begin
	end
end




