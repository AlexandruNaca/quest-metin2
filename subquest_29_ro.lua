---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_29 begin
	state start begin
		when login or levelup or enter with pc.get_level() >=32  and pc.get_level() <= 34 begin
			 set_state( information )
		end
	end

	state information begin
		when letter begin
					
			local v = find_npc_by_vnum(20355)

			if v != 0 then
				target.vid("__TARGET__", v, "Du-te la Capitan")
			end
		end

				
		when __TARGET__.target.click or
			20355.chat."Arcasi vant negru" with pc.level >= 32 begin
			target.delete("__TARGET__")
			--                                                  |
			say_title("Capitan:")
			say_verde("")
			say_verde("Trebuie sa reducem numarul armatei negre,")
			say_verde("de aceea ma bazez pe tine, vreau sa mergi")
			say_verde("sa omori 100 de Arcasi vant negru, crezi")
			say_verde("ca esti capabil sa faci acest lucru?")
			local s=select("Floare la ureche","Nu cred ca pot")
                if 2==s then
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")
                        say_verde("")
                        local a=select("Da, vreau","Inchide")
                        if  2==a then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                return
                        end
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Atunci nu mai avem ce discuta!")
                        set_state(__GIVEUP__)
                        return
                end
            say_title("Capitan:")
            say_verde("")
            say_verde("Du-te in satul vecin si omoara 100")
            say_verde("de Arcasi vant negru, succes!")
			pc.setqf("kill_count", 0)
			q.set_counter("Arcasi vant negru: ",0)
			set_state(goto_blackwind)

		end	
	end
	state goto_blackwind begin
		when letter begin
                send_letter("~Lv 32 - Arcasi vant negru")
                q.set_icon("scroll_open_golden.tga")
			q.start()
		end

		when info or button begin
			say_title("Arcasi vant negru")
			say_verde("")
			say_verde("Capitanul vrea sa ajuti la reducerea")
			say_verde("numarului din armata vantului negru.")
			say_verde("Du-te si omoara 100 de Arcas vant")
			say_verde("negru, dupa intoarce-te la Capitan.")
			say_verde("")
			say_reward("Pana acum ai omorat "..pc.getqf("kill_count").." Arcasi.")
			
		end
		when 20355.chat."Arcasi vant negru" with pc.level >=32 begin
			say_title("Capitan")
			say_verde("")
			say_verde("Nu i-ai omorat inca? vrei sa mai incerci")
			say_verde("sa omori 100 de Arcasi vant negru ?")
			local s=select("Mai incerc","Nu cred ca pot")
                if 2==s then
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")
                        say_verde("")
                        local a=select("Da, vreau","Inchide")
                        if  2==a then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                return
                        end
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Atunci nu mai avem ce discuta!")
                        set_state(__GIVEUP__)
                        return
                end
            say_title("Capitan:")
            say_verde("")
            say_verde("Du-te in satul vecin si omoara 100")
            say_verde("de Arcasi vant negru, succes!")
		end
		
		when 403.kill  begin
			local count=pc.getqf("kill_count")+1
			if count<=100  then	
				pc.setqf("kill_count",count)
				q.set_counter("Arcasi vant negru: ",100-count)
				if count== 100 then
					set_state(go_back_to_boss)
				end
			end	
		end
	end

	state go_back_to_boss begin
		when letter begin
                send_letter("~Lv 32 - Am omorat toti arcasii")
                q.set_icon("scroll_open_golden.tga")
			q.start()
			local v = find_npc_by_vnum(20355)

			if v != 0 then
				target.vid("__TARGET__", v, "Du-te la Capitan")
			end

		end

		when info or button begin
            say_title("Am omorat toti arcasii")
            say_verde("")
            say_verde("Du-te la Capitan si raporteaza.")
		end
		
		when __TARGET__.target.click or
			20355.chat."Am omorat toti arcasii" begin
			target.delete("__TARGET__")
			say_title("Captain:")
			say_verde("")
			say_verde("Ha! Tu chiar ai reusit! Ai devenit un")
			say_verde("soldat de elita al regatului nostru!")
			say_verde("")
            say_reward("Recompensa:" )
            say_reward("2.000.000 Puncte de experienta")
            say_reward("120.000 Yang")
            say_reward("x20 Mantia curajului")
            pc.give_exp2(3000000)
            pc.change_money(120000)
            pc.give_item2(70038, 20)
			set_quest_state("levelup","run")
			pc.setqf("kill_count", 0)
			set_state(COMPLETE)
			clear_letter()
		end

		end
	state __GIVEUP__ begin
	end
	state COMPLETE begin
	end
end
