---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_2 begin
        state start begin
                when login or levelup with pc.level >= 7 and pc.level <= 12 begin
                        set_state(information)
                end
        end
        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9003)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Cina")
                        end
                end


                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Sunt sigura ca il cunosti pe Negustorul")
                        say_verde("de Armuri. Vreau sa pregatesc o cina pentru")
                        say_verde("el si vreau sa sti ce ar prefera sa manance.")
                        say_verde("")
                        say_verde("Du-te la el si intreaba-l pentru mine te rog.")

                        set_state(ask_dinner)
                end
        end

        state ask_dinner begin
                when letter begin
                        local v=find_npc_by_vnum(9002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Catre Negustorul de Armuri.")
                        end
                end
                when letter begin
                        send_letter("~Lv 7 - Catre Negustorul de Armuri")
                        q.set_icon("scroll_open_golden.tga")
                end
                when button or info begin
                        say_title("Catre Negustorul de Armuri")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Negustoarea vrea sa prepare o cina pentru")
                        say_verde("tatal ei, dute la negustorul de armuri si")
                        say_verde("intreaba-l ce ar prefera sa manance.")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")

                        say_title("Negustorul de Armuri:")
                        say_verde("")
                        say_verde("Oh, ce dragut din partea fiicei mele sa")
                        say_verde("pregateasca cina, pai daca tot am de ales")
                        say_verde("am sa aleg reteta mea preferata:")
                        say_verde("")
                        say_reward("Supa de urs cu doua oua.")

                        set_state(report)
                end
        end

        state report begin
                when letter begin
                        local v = find_npc_by_vnum(9003)
                        if v!= 0 then
                                target.vid("__TARGET__", v, "Cina")
                        end
                end

                when letter begin
                        send_letter("~Lv 7 - Cina")
                        q.set_icon("scroll_open_golden.tga")
                end

                when button or info begin
                        say_title("CIna")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Negustorul de Armuri ti-a zis ce ar dori")
                        say_verde("la cina, du-te la negustoare si spune-i.")
                end

                when 9002.chat."Cina" begin

                        say_title("Armor Shop Dealer:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Spune-i fiicei mele ca as dori sa mananc")
                        say_verde("o supa de urs cu doua oua, imi e pofta.")
                end


                when __TARGET__.target.click begin
                        target.delete("__TARGET__")

                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Ce a spus tatal meu ca vrea sa manance?")
                        say_verde("")

                        local s = select(
                                "Supa de oua",
                                "Supa de urs fara oua",
                                "Supa de urs cu doua oua",
                                "Am uitat")

                        if s == 3 then
                                say_title("Magazinul general:")
                                say_verde("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("Multumesc pentru ca m-ai ajutat.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("4.000 Puncte de experienta")
                                say_reward("5.000 Yang" )
                                say_reward("x1 Cufar lumina lunii")

                                pc.give_exp2(4000)
                                set_quest_state("levelup","run")
                                pc.change_money( 5000 )
                                pc.give_item2(50011)

                                clear_letter()
                                set_state(__COMPLETE__)
                        elseif s == 4 then
                                say_verde("Magazinul general:")
                                say_verde("")
                                say_verde("Nu e nici o problema daca ai uitat.")
                                say_verde("Du-te inapoi si intreaba-l din nou.")

                                set_state(ask_dinner)

                        else
                                say_verde("Magazinul general:")
                                say_verde("")
                                say_verde("A spus el ca vrea la cina asa ceva?")
                                say_verde("")
                                say_verde("Ciudat, du-te si intreaba-l din nou.")

                                set_state(ask_dinner)
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end