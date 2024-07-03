---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv10 begin
	state start begin
	end

	state run begin
		when login or levelup or enter begin
			if  pc.get_level() >= 10 then
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

			send_letter("+Lv 10 - Du-te la capitan")
			q.set_icon("scroll_open_purple.tga")
			q.start()
		end

		when button begin
			say_title("Du-te la capitan")
			say_verde("")
			say_verde("Gardianul este multumit de instructajul tau si")
			say_verde("te trimite la Capitanul satului, dute la el.")
		end

		when info begin
			say_title("Du-te la capitan")
			say_verde("")
			say_verde("Gardianul este multumit de instructajul tau si")
			say_verde("te trimite la Capitanul satului, dute la el.")
		end

		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			say_title("Capitan")
			say_verde("")
			say_verde("Eu sunt capitanul satului si de acum inainte")
			say_verde("eu ma voi ocupa de instructajul tau, inteles?")
			wait()
			say_title("Capitan")
			say_verde("")
			say_verde("Te vei acomoda cu regulile mele si vei face asa")
			say_verde("cum spun eu, viata ta si a celor din sat depind")
			say_verde("de mine, eu iti voi da sarcini serioase de acum.")
			wait()
			say_title("Capitan")
			say_verde("")
			say_verde("Am sa ii transmit un mesaj lui Yu-Hwan, el este")
			say_verde("in satul vecin. Dute la el cu aceasta scrisoare.")
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
			
			setskin(NOWINDOW)
			send_letter("+Lv 10 - Du-te la Yu-Hwan")
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
		    20017.chat."Mesaj de la capitan" begin
			target.delete("__TARGET__")
			say_title("Yu-Hwan")
			say_verde("")
			say_verde("Inteleg, capitanul te-a trimis la mine cu aceasta")
			say_verde("scrisoare. Multumesc pentru livrare razbonicule.")
			wait()
			say_title("Yu-Hwan")
			say_verde("")
			say_verde("Dute inapoi la Capitan si raporteaza ca totul")
			say_verde("este in ordine. Satenii nu au de ce sa se teama.")
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
			send_letter("+Lv 10 - Inapoi la capitan")
           	q.set_icon("scroll_open_purple.tga")
			q.start()
		end

		when button begin
			say_title("Inapoi la capitan")
			say_verde("")
			say_verde("Yu-Hwan te-a trimis inapoi la Capitan sa raportezi.")
		end

		when info begin
			say_title("Inapoi la capitan")
			say_verde("")
			say_verde("Yu-Hwan te-a trimis inapoi la Capitan sa raportezi.")
		end

		when __TARGET__.target.click begin
			pc.give_exp2(15000)
			pc.change_money(40000)
         	pc.give_item2(27105,10)
         	pc.give_item2(27102,10)
			target.delete("__TARGET__")

			say_title("Capitan")
			say_verde("")
			say_verde("Ai reusit, intradevar gardianul avea dreptate cu")
			say_verde("privire la tine, esti un razboinic foarte iscusit.")
			say_verde("")
	        say_reward("Recompensa:")
	        say_reward("15.000 Puncte de experienta")
	        say_reward("40.000 Yang")
	        say_reward("x10 Licoare de viteza de miscare (L)")
	        say_reward("x10 Licoare de viteza de atac (L)")
	        set_quest_state("levelup","run")
			set_quest_state("main_quest_lv12", "run")
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
