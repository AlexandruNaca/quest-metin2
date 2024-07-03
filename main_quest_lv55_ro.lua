---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv55 begin
	state start begin
	end
	state run begin
		when login or levelup with  pc.get_level() >= 55 begin
			set_state( survey8 )
		end
	end

state survey8 begin
		when letter begin
            send_letter( "+Lv 55 - Pagina a 12-a" )
            q.set_icon("scroll_open_purple.tga")

			if main_quest_lv55.is_other_vil()==1  then
				local v=find_npc_by_vnum(20357)
				if 0==v then
				else
					target.vid("__TARGET1__", v, "Du-te la Monumentul Weol")
				end
			end
		end
		when button or info begin
			local empire = pc.get_empire()
			if empire ==1 then --Pandemonia
				----"12345678901234567890123456789012345678901234567890"|
				say_title("Pagina a 12-a")
				say_verde("")
				----"12345678901234567890123456789012345678901234567890"|
				say_verde("Se spune ca Pagina a 12-a este undeva")
				say_verde("langa Monumentul Weol, du-te acolo.")

			elseif empire ==2 then --Asmodia
				----"12345678901234567890123456789012345678901234567890"|
				say_title("Pagina a 12-a")
				say_verde("")
				----"12345678901234567890123456789012345678901234567890"|
				say_verde("Se spune ca Pagina a 12-a este undeva")
				say_verde("langa Monumentul Weol, du-te acolo.")

			elseif empire ==3 then  --Elgoria
				----"12345678901234567890123456789012345678901234567890"|
				say_title("Pagina a 12-a")
				say_verde("")
				----"12345678901234567890123456789012345678901234567890"|
				say_verde("Se spune ca Pagina a 12-a este undeva")
				say_verde("langa Monumentul Weol, du-te acolo.")
			end

		end

		function is_other_vil()
			local empire = pc.get_empire()
			local map_num= pc.get_map_index()

			local is_village = 0

			if empire == 1 and map_num == 21 then is_village = 1 end
			if empire == 2 and map_num == 41 then is_village = 1 end
			if empire == 3 and map_num ==  1 then is_village = 1 end
			return is_village
		end

		when __TARGET1__.target.click or
			20357.chat."Pagina a 12-a" begin
			say_title("Monument piatra Weol")
			say("")
			say_verde("Asta este! Am gasit Pagina a 12-a!")
			pc.give_item2(30150)
			set_state( gototeacher8)
		end
	end

	state gototeacher8 begin
		when letter begin
            send_letter( "+Lv 55 - Pagina a 12-a" )
            q.set_icon("scroll_open_purple.tga")
			if main_quest_lv55.is_my_vil()==1 then
				local v=find_npc_by_vnum(20011)
				if 0==v then
				else
					target.vid("__TARGET__", v, "Du-te la uriel")
				end
			end
		end
		when button or info begin
			local empire = pc.get_empire()
			if empire ==2 then --Asmodia
				say_title("Pagina a 12-a")
				say_verde("")
				say_verde("Ai gasit pagina a 12-a, du-te la Uriel.")

			elseif empire ==1 then --Pandemonia
				say_title("Pagina a 12-a")
				say_verde("")
				say_verde("Ai gasit pagina a 12-a, du-te la Uriel.")				

			elseif empire ==3 then --Elgoria
				say_title("Pagina a 12-a")
				say_verde("")
				say_verde("Ai gasit pagina a 12-a, du-te la Uriel.")
			end

		end

		function is_my_vil()
			local empire = pc.get_empire()
			local map_num= pc.get_map_index()

			local is_village = 0

			if empire == 1 and map_num == 1 then is_village = 1 end
			if empire == 2 and map_num == 21 then is_village = 1 end
			if empire == 3 and map_num == 41 then is_village = 1 end
			return is_village
		end

		when __TARGET__.target.click or
			20011.chat."Pagina a 12-a" with main_quest_lv55.is_my_vil()==1 begin
			target.delete("__TARGET__")
			----------                                                   l
			say_title("Uriel:")
			say_verde("")
			say_verde("Ai gasit pagina a 12-a? Super, suntem la")
   			say_verde("ultimele pagini ale jurnalului secret.")
			wait()
            say_title("Uriel:")
            say_verde("")
            say_verde("Mai lipseste inca o pagina din jurnal.")
            say_verde("")
            say_reward("Recompensa:")
            say_reward("20.000.000 Puncte de experienta")
            say_reward("2.000.000 Yang")
            say_reward("x60 Mantia curajului")
            say_reward("x20 Binecuvantarea dragon")
            pc.give_exp2(20000000)
            pc.change_money(2000000)
            pc.give_item2(70038,60)
            pc.give_item2(71020,20)
			pc.remove_item(30150)
			set_state(last_shot)
		end
	end

	state last_shot begin
		when letter begin
            send_letter( "+Lv 55 - Ultima pagina" )
            q.set_icon("scroll_open_purple.tga")

		end
		when button or info begin
			say_title("Ultima pagina")
			---                                                   l
			say_verde("")
			say_verde("Ultima pagina din jurnalul secret se afla")
			say_verde("in templul intunecat la capcauni.")
		end

		when 1303.kill begin
			local s = number(1, 100)
			if s <= 5 and pc.count_item("30150")==0 then
				---                                                   l
				notice("Ultima pagina nu este la capcauni... Trebuie sa fie pe altundeva.")
				set_state(takepaper)
			end
		end
	end

	state takepaper begin
		when letter begin
            send_letter( "+Lv 55 - Ultima pagina" )
            q.set_icon("scroll_open_purple.tga")

			local v=find_npc_by_vnum(20363)
			if 0==v then
			else
				target.vid("__TARGET1__", v, "Du-te la Monumentul Gum")
			end

		end
		when button or info begin
			say_title("Ultima pagina")
			say_verde("")
			say_reward("Ultima pagina trebuie sa fie mai adanc in")
			say_reward("templul intunecat, du-te si cauta langa")
			say_reward("Monumentul Gum langa turnul demonilor.")
		end
		when __TARGET1__.target.click or
			20363.chat."Ultima pagina" begin
			target.delete("__TARGET1__")
			say_title("Monument Gum")
			say_verde("")
			say_verde("Asta este! Am gasit ultima pagina!")
			pc.give_item2(30150)
			set_state( gototeacher)
		end
	end
	state gototeacher begin
		when letter begin
            send_letter( "+Lv 55 - Ultima pagina" )
            q.set_icon("scroll_open_purple.tga")

			local v=find_npc_by_vnum(20011)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Du-te la Uriel")
			end
		end
		when button or info begin
			say_title("Ultima pagina")
			say_verde("")
			say_verde("Ai gasit ultima pagina, du-te la Uriel.")
		end
		when __TARGET__.target.click or
			20011.chat."Ultima pagina" begin
			target.delete("__TARGET__")
			---                                                   l
			say_title("Uriel:")
			say_verde("")
			say_verde("In sfarsit! Ultima pagina din jurnalul secret.")
			wait()
			say_title("Uriel")
			say_verde("")
			-----------                                                   l
			say_reward("Ce? Atata a fost tot? Am batut atata cale")
			say_reward("pana aici doar pentru niste informatii pe")
			say_reward("care le stim cu totii? Ce dezamagire...")
			wait()
			say_title("Uriel:")
			say_verde("")
			say_verde("Multumesc ca m-ai ajutat tot timpul acesta.")
			say_verde("")
            say_reward("Recompensa:")
            say_reward("25.000.000 Puncte de experienta")
            say_reward("2.500.000 Yang")
            say_reward("x60 Mantia curajului")
            say_reward("x20 Binecuvantarea dragon")
            say_reward("x1 Inelul experientei ( 30 Minute )")
            pc.give_exp2(25000000)
            pc.change_money(2500000)
            pc.give_item2(70038,60)
            pc.give_item2(71020,20)
            pc.give_item2(72002)
			pc.remove_item(30150)

			clear_letter()
			set_state(__COMPLETE__)
		end
	end
	state __COMPLETE__ begin
	end
end