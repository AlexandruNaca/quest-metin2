---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_40 begin
        state start begin
                when login or levelup with pc.level >= 56  and pc.level <= 58 begin
                        set_state(information)
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
                        20355.chat."Ajutor pentru razboi" with pc.level >= 56 begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Avem nevoie de ajutor pe timp de razboi")
                        say_verde("de aceea am o sarcina speciala pentru")
                        say_verde("tine, si nu va fi usor deloc.")
                        wait()
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Regatul nostru ramane fara provizii")
                        say_verde("si suntem in pericol. Avem nevoie de")
                        say_verde("proviziile necesare, si asta urgent.")
                        wait()
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Trebuie sa faci rost de 1.000 de varfuri")
                        say_verde("de sageata de la Arcas al ciumei salbatic.")
                        say_verde("")
                        say_verde("Crezi ca esti in stare de asa ceva?")
                        local s=select("Floare la ureche","Nu am timp")
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
                        say_verde("Du-te si fa rost de varfuri de sageti.")
                        set_state(for_five_thousand_bow)
                end

        end
        state for_five_thousand_bow begin
                when letter begin
                        send_letter("~Lv 56 - Ajutor pentru razboi")
                        q.set_icon("scroll_open_golden.tga")

                        if pc.count_item(30157)>=1000 then
                                local v=find_npc_by_vnum(20355)
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Du-te la  Capitan")
                                end
                        end

                end
                when button or info begin
                        if      pc.count_item(30157)>=1000 then
                                say_title("Ajutor pentru razboi")
                                say_verde("")
                                say_verde("Ai obtinut toate cele 1.000 de varfuri")
                                say_verde("de sageti, du-te cu ele la Capitan.")
                                return
                        end
                        say_title("Ajutor pentru razboi")
                        say_verde("")
                        say_verde("Capitanul are nevoie de 1.000 de")
                        say_verde("varfuri de sageti. Du-te si omoara")
                        say_verde("Arcas al ciumei salbatic.")
                        say_item_vnum(30157)
                end

                when 20355.chat."Ajutor pentru razboi" with pc.count_item(30157) <1000 begin
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Nu ai toate varfurile de sageata la")
                        say_verde("tine, vrei sa mai incerci sa faci")
                        say_verde("rost de ele, sau e prea greu?")
                        local s=select("Nah, ma descurc", "E prea greu...")
                        if 2==s then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a= select("Da, vreau","Inchide")
                                if 2==a then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Poate ca pana la urma esti un las.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Du-te si fa rost de varfuri de sageata.")
                end

                when 936.kill   begin
                        local s = number(1, 5)
                        if s <= 40 and pc.count_item(30157)<1000 then
                                pc.give_item2(30157, 5)
                        end


                end

                when __TARGET__.target.click  or
                        20355.chat."Ajutor pentru razboi" with pc.count_item(30157)>=1000 begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Ha? Ai reusit? Sunt mandru de tine!")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("30.000.000 Puncte de experienta")
                        say_reward("1.000.000 Yang")
                        say_reward("x10 Cufar mistic")
                        say_reward("x5 Marmura binecuvantata")
                        say_reward("x200 Mantia curajului")

                        pc.remove_item(30157, 1000)
                        pc.give_item2(50217,10)
                        pc.give_item2(70024,5)
                        pc.give_item2(70038,200)
                        pc.give_exp2(30000000)
                        pc.change_money(1000000)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(COMPLETE)
                end
        end
        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
        state __GIVEUP__ begin
        end
end