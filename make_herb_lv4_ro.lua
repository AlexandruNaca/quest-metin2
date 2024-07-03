---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest make_herb_lv4  begin
	state start begin
		when login or levelup with pc.get_level() ==4  begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then
				target.vid("__TARGET__", v, "Biologul Chaegirab")
			end
			send_letter("&Lv 4 - Cercetarea biologului")
			q.set_icon("scroll_open_green.tga")
		end

		when button or info begin
			say_title("Cercetarea biologului")
			say_verde("")
			say_verde("Chaegirab ar vrea sa vorbeasca cu tine.")
			say_verde("Cauta-l si vezi daca poti sa-l ajuti.")
		end
		
		when __TARGET__.target.click or
			20084.chat."Te rog sa ma asculti." begin
			target.delete("__TARGET__")
			say_title("Biologul Chaegirab:")
			say_verde("")
			say_verde("Am nevoie de cineva ca tine sa ma ajute cu")
			say_verde("cercetariile mele, in schimbul ajutorului")
			say_verde("oferit te voi rasplati cu diferite obiecte.")
			wait()
			say_title("Biologul Chaegirab:")
			say_verde("")
			say_verde("Momentan studiez Florile de piersic si am nevoie")
			say_verde("de 10 exemplare care sa nu fie putrede, inteles?")
			set_state(go_to_disciple)
			pc.setqf("collect_count",0) 
			pc.setqf("drink_drug",0) 
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Lv 4 - Cercetarea biologului")
			q.set_icon("scroll_open_green.tga")
		end
		when button or info begin
			say_title("Colecteaza Flori de piersic")
			say_verde("")
			say_verde("Biologul Chaegirab student al invatatorului Uriel")
			say_verde("tocmai cerceteaza Flori de piersic.")
			say_verde("")
			say_verde("Vaneaza "..mob_name(173).." pentru a le obtine.")
			say_item_vnum(50701) 
			say_reward("Pana acum ai colectat ".." "..pc.getqf("collect_count").." exemplare.")
		end
		
		when 71035.use begin --°g´bÃÄ¤ô
			if pc.getqf("drink_drug")==1 then
				say_verde("")
				say_verde("A fost folosita 1 data.")

				return
			end
			if pc.count_item(50701)==0 then
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_verde("Am nevoie de exemplare pentru studiile mele.")
				return
			end
			item.remove()	
			pc.setqf("drink_drug",1)
		end


		when 173.kill begin
			if pc.count_item(50701)<10-pc.getqf("collect_count") then
				pc.give_item2(50701, 1)
			end
		end
		
    	when 20084.chat."Ai gasit Floarea de piersica?" with pc.count_item(50701) >0   begin
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_verde("Dami cateva momente sa studiez acest exemplar.")
				pc.remove_item(50701, 1)
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=90
				else		
					pass_percent=100
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 9 then     -- 10­below
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)     -- made a +1
						say_title("Biologul Chaegirab:")
						say_verde("")
						say_verde("Acest exemplar este excelent, multumesc.")
						say_verde("Mai am nevoie de inca ".." "..10-pc.getqf("collect_count").. " exemplare.")
						pc.setqf("drink_drug",0)	 -- syrup initialization
						return
					end
					say_title("Biologul Chaegirab:")
					say_verde("")
					say_reward("Pentru ajutorul dat Biologului Chaegirab")
					say_reward("ai primit 2.000 experienta si 10.000 Yang")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					clear_letter()
					set_state(__complete)
					
					if pc.job==3 then		
						pc.give_item2(7016)
						say_reward("Evantai de fier+6")
						return
					else  	
						pc.give_item2(26)
						say_reward("Sabie lunga+6")
					end
					pc.change_money(10000)
					pc.give_exp2(2000)
					set_quest_state("levelup","run")
					
				else								
				say_title("Biologul Chaegirab:")
				say_verde("")
				say_reward("Acest exemplar este putred, imi pare rau.")
				pc.setqf("drink_drug",0)	 -- syrup initialization
				return
				end
	end
end


state __complete begin
	end
end



