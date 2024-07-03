---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_7 begin
        state start begin
                when login or levelup with pc.level >= 12 and pc.level <= 17 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20008)

                        if v!= 0 then
                                target.vid("__TARGET2__", v, "Cea mai buna carte")
                        end
                end

                when __TARGET2__.target.click or 20008.chat."Cea mai buna carte" with pc.level >= 12 begin
                        target.delete("__TARGET2__")

                        say_title("Octavio:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Iti aduci aminte de Soon? Vreau sa il")
                        say_verde("intreb care e cea mai buna carte de")
                        say_verde("bucate pentru retetele mele.")
                        say_verde("")
                        say_verde("Du-te pana la el si intreaba-l.")

                        set_state(ask_to_sunyugil)
                end
        end

        state ask_to_sunyugil begin
                when letter begin
                       send_letter("~Lv 12 - Cea mai buna carte")
                        q.set_icon("scroll_open_golden.tga")
                end

                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Soon")
                        end

                end

                when info or button begin
                        say_title("Cea mai buna carte")
                        say_verde("")
                        say_verde("Du-te la Soon si intreaba-l care este")
                        say_verde("cea mai buna carte de bucate.")
                end

                when 20023.chat."Cea mai buna carte" begin
                        target.delete("__TARGET__")
                        say_title("Soon")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, iarasi tu? Ce doresti de la mine?")
                        say_verde("Da, am cea mai buna carte de bucate,")
                        say_verde("poftim, nu am nevoie de ea oricum.")
                        say_verde("")
                        say_verde("Acum pleaca, lasa-ma sa citesc.")

                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        send_letter("~Lv 12 - Cea mai buna carte")
                        q.set_icon("scroll_open_golden.tga")
                end

                when letter begin
                        local v=find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET3__",v,"Du-te la Octavio")
                        end
                end

                when info or button begin
                        say_title("Cea mai buna carte")
                        say_verde("")
                        say_verde("Ai cartea, du-te cu ea la Octavio.")
                end

                when __TARGET3__.target.click or 20008.chat."Cea mai buna carte" begin
                        target.delete("__TARGET3__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Octavio:")
            		  say_verde("")
                        say_verde("Hm, haide sa vedem ce retete sunt pe aici.")
                        say_verde("Wow, intradevar este cea mai buna carte.")
                        wait()

           		       say_title("Octavio:")
                        say_verde("")
                        say_verde("As dori sa incerc o reteta de aici, am")
                        say_verde("toate incredientele necesare mai putin") 
                        say_verde("un intestin de lup gri, ajuta-ma sa fac")
                        say_verde("rost de unul si am sa te rasplatesc.")

                        set_state(hunt_for_oku)
                end
        end

        state hunt_for_oku begin
                when letter begin
                        send_letter("~Lv 12 - Cea mai buna carte")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when info or button begin
                        say_title("Cea mai buna carte")
                        say_verde("")
                        say_verde("Fa rost de intestin de lup gri pentru")
                        say_verde("Octavio, are nevoie pentru retetele lui.")
                        say_item_vnum("30026")
                        say_reward("Du-te si omoara niste lupi gri.")
                end

        when 106.kill begin
			local s = number(1, 80)
			if s <= 5 and pc.count_item(30026)==0  then
				pc.give_item2(30026, 1)
				local v=find_npc_by_vnum(20008)
				if 0==v then
				else
					target.vid("__TARGET4__",v,"")
				end
                        end
                end

                when __TARGET4__.target.click or 20008.chat."Am intestinul de lup" begin
                        target.delete("__TARGET4__")
                        if pc.count_item("30026") >= 1 then
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Multumesc, acum pot gati reteta.")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("10.000 Puncte de experienta")
                                say_reward("20.000 Yang")
                                say_reward("x2 Cufar lumina lunii")
                                pc.remove_item(30026)
                                pc.give_exp2(10000)
                                pc.change_money(20000)
                                pc.give_item2(50011, 2)
                                clear_letter()
                                set_quest_state("levelup","run")
                                set_state(__COMPLETE__)
                        else
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Nu ai intestinul de lup la tine.")
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end