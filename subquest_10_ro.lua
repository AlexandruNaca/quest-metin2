---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_10 begin
        state start begin
                when login or levelup with pc.level >= 18 and pc.level <= 23 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9003)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Acul de par furat")
                        end
                end


                when __TARGET__.target.click or
                        9003.chat."Acul de par furat" with pc.level >= 18 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Am o mare problema, cineva mi-a furat")
                        say_verde("acul decorativ de par chiar de sub nas.")
                        say_item_vnum(30017)
                        wait()
                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Acul acesta are o valoare sentimentala")
                        say_verde("pentru mine, de aceea e asa important.")
                        say_verde("")
                        say_verde("Poti sa il gasesti pentru mine te rog?")
                          local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Magazinul general:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Atunci la revedere placuta, o sa")
                                say_verde("ma descurc eu cumva, hai dispari.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Multumesc frumos ca ma ajuti.")
                        set_state(go_to_Fierar)

                end
        end

        state go_to_Fierar begin
                when letter begin
                        send_letter("~Lv 18 - Acul de par furat")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v = find_npc_by_vnum(20016)

                        if v == 0 then
                        else
                                target.vid("__TARGET__", v, "Du-te la fierar")
                        end
                end

                when info or button begin
                        say_title("Acul de par furat")
                        say_verde("")
                        say_verde("Intreaba-l pe fierar daca stie ceva.")
                        say_item_vnum(30017)
                end

                when __TARGET__.target.click or
                        20016.chat."Acul de par furat" with pc.level >= 18 begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Crede ca eu l-am furat? Asta e ridicol.")
                        say_verde("Cine crede ca sunt? Eu lucram in atelier")
                        say_verde("nici nu stiu despre ce ac vorbesti.")
                        wait()
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Hm, poate nu ar trebui sa iti spun dar")
                        say_verde("negustorul de arme tot a umblat pe aici.")

                        set_state(ask_to_weaponshop)
                end
        end

        state ask_to_weaponshop begin
                when letter begin
                        send_letter("~Lv 18 - Acul de par furat")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v= find_npc_by_vnum(9001)
                        if v == 0 then
                        else
                                target.vid("__TARGET__", v, "Du-te la negustorul de arme")
                        end
                end
                ----"12345678901234567890123456789012345678901234567890"|
                when info or button begin
                        say_title("Acul de par furat")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu negustorul de arme.")
                end

                when __TARGET__.target.click or
                        9001.chat."Acul de par furat" with pc.level >= 18 begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Negustorul de arme:")
                        say_verde("")
                        say_verde("Nu e adevarat, nu eu am furat acul!")
                        say_verde("")
                        say_verde("Intradevar am fost acolo, dar negustoarea")
                        say_verde("nu era acolo, in schimb am vazut o femeie")
                        say_verde("care semana cu o amazoana, cand m-a vazut")
                        say_verde("a fugit, poate ea a furat acul decorativ.")

                        set_state(hunt_for_shoes)
                end
        end

        state hunt_for_shoes begin
                when letter begin
                        send_letter("~Lv 18 - Acul de par furat")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when info or button begin
                	if pc.count_item(30017)==0 then
				say_title("Acul de par furat")
				say_verde("")
				say_verde("Acul de par a fost furat de cineva din")
				say_verde("juramantul alb, du-te si ia-l inapoi.")
				say_item_vnum(30017)
			else
				say_title("Acul de par furat")
				say_verde("")
				say_verde("Ai obtinut acul, du-te la negustoare.")
				say_verde("")
			end
                end

                when 302.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30017)==0  then
                                pc.give_item2(30017, 1)
                                send_letter("~Lv 18 - Ai gasit acul de par")
                                q.set_icon("scroll_open_golden.tga")
                                local v=find_npc_by_vnum(9003)
                                if 0== v then
                                else
                                        target.vid("__TARGET__",v,"Inapoi la magazinul general")
                                end
                        end

                end

                when __TARGET__target.click or
                        9003.chat."Am gasit acul de par" with pc.level >= 18 begin
                        target.delete("__TARGET__")
                        if pc.count_item(30017) >= 1 then
                                say_title("Magazinul general:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Inteleg, deci pana la urma juramantul")
                                say_verde("alb a fost vinovat! Oh, imi pare rau")
                                say_verde("ca am acuzat satenii de furt, am fost")
                                say_verde("stresata. Dar acum il am din nou, iti")
                                say_verde("multumesc frumos ca m-ai ajutat!")
                                wait()
                                say_title("Magazinul general:")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("100.000 Puncte de experienta")
                                say_reward("50.000 Yang")
                                say_reward("x2 Cufar lumina lunii")
                                pc.give_exp2(100000)
                                pc.change_money(50000)
                                pc.give_item2(50011, 2)
                                pc.remove_item(30017, 1)
                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Nu ai acul decorativ de par la tine?")
                                say_verde("Of, du-te te rog si mai cauta-l.")
                                local s=select("Ma duc acum","Nu am timp")
                                if 2==s then
                                    say_title("Magazinul general:")
                                    say_verde("")
                                    say_verde("Vrei sa abandonezi misiunea?")
                                        local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                say_title("Magazinul general:")
                                                say_verde("")
                                                say_verde("Oh, ce bine ca te-ai razgandit")
                                                set_state(information)
                                                return
                                        end
                                        say_title("Magazinul general:")
                                        say_verde("")
                                        say_verde("Atunci la revedere placuta, o sa")
                                        say_verde("ma descurc eu cumva, hai dispari.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Multumesc frumos ca ma ajuti.")
                        end
                end
        end
        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
                when enter begin
                        set_quest_state("levelup","run")
                        q.done()
                end
        end
end