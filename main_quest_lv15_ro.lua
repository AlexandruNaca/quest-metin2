---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv15 begin
	state start begin
	end

	state run begin
		when login or levelup or enter begin
			if  pc.get_level() >= 15 then
				setstate(gotoboss)
			end
		end
	end

	state gotoboss begin
		when letter begin
			local v = find_npc_by_vnum(20355)

			if 0 != v then
				target.vid("__TARGET__", v, "Capitan")
			end

			send_letter("+Lv 15 - Dute la capitan")
			q.set_icon("scroll_open_purple.tga")
			q.start()
		end

		when button begin
			say_title("Du-te la capitan")
			say_verde("")
			say_verde("Capitanul te cauta, du-te si vorbeste cu el.")
		end

		when info begin
			say_title("Du-te la capitan")
			say_verde("")
			say_verde("Capitanul te cauta, du-te si vorbeste cu el.")
		end

		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			say_title("Capitan")
			say_verde("")
			say_verde("Iti mai aduci aminte de prietenul meu Yu-Hwan ?")
			wait()
			say_title("Capitan")
			say_verde("")
			say_verde("Trebuie sa ii trimit o scrisoare dar nu am timp.")
			say_verde("Ocupate tu te rog si dute la el, poftim scrisoarea.")
			setstate(gotomusition)
			q.done()
		end
	end

	state gotomusition begin
		when letter begin
			local v = find_npc_by_vnum(20017)
			if 0 != v then
				target.vid("__TARGET__", v, "Yu-Hwan")
			end
			
			send_letter("+Lv 15 - Du-te la Yu-Hwan")
		    q.set_icon("scroll_open_purple.tga")
			q.start()
		end
	
		when button begin
			say_title("Du-te la Yu-Hwan")
			say_verde("")
			say_verde("Capitanul te-a trimis la muzicianul Yu-Hwan.")
			say_verde("Acesta se afla in tinutul Bakra, grabeste-te.")
		end
		
		when info begin
			say_title("Du-te la Yu-Hwan")
			say_verde("")
			say_verde("Capitanul te-a trimis la muzicianul Yu-Hwan.")
			say_verde("Acesta se afla in tinutul Bakra, grabeste-te.")
		end

		when __TARGET__.target.click or 
		    20017.chat."Scrisoare de la capitan" begin
			target.delete("__TARGET__")
			say_title("Yu-Hwan:")
			say_verde("")
			say_verde("Multumesc pentru scrisoarea de la Capitan. Acum")
			say_verde("te poti intoarce inapoi in sat si sa raportezi.")
			setstate(gotoboss2)
			q.done()
		end
	end

	state gotoboss2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
			
			if 0 != v then
				target.vid("__TARGET__", v, "Capitan")
			end

			setskin(NOWINDOW)
			send_letter("+Lv 15 - Inapoi la capitan")
           	q.set_icon("scroll_open_purple.tga")
			q.start()
		end

		when button begin
			say_title("Inapoi la capitan")
			say_verde("")
			say_verde("Du-te inapoi in sat la Capitan si raporteaza.")
		end

		when info begin
			say_title("Inapoi la capitan")
			say_verde("")
			say_verde("Du-te inapoi in sat la Capitan si raporteaza.")
		end

		when __TARGET__.target.click begin
			pc.give_exp2(70000)
			pc.change_money(50000)
			target.delete("__TARGET__")
			say_title("Capitan")
			say_verde("")
			say_verde("Multumesc, stiam ca ma pot baza pe tine. Esti")
			say_verde("un razboinic de incredere, asa sa ramai mereu.")
			say_verde("")
	        say_reward("Recompensa:")
	        say_reward("70.000 Puncte de experienta")
	        say_reward("50.000 Yang")
			set_quest_state("levelup","run")
			set_quest_state("main_quest_lv16", "run")
			q.done()
			setstate(__COMPLETE__)
		end
	end

	state __COMPLETE__ begin
		when enter begin
			q.done()
		end
	end
end
