---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_34 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=40  and pc.get_level() <= 42 begin
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
                        20355.chat."Omoara liderii vantului" with pc.level >= 40  begin
                        target.delete("__TARGET__")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Trebuie sa eliminam liderii vantului negru,")
                        say_verde("acestia sunt Gu-Ryung de vant negru, Jak-To")
                        say_verde("si To-Su. O sa te ocupi de aceasta sarcina?")
                        local s=select("Ma ocup eu","Nu am timp")
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
                        say_verde("Du-te si fa rost de materiale!")
                        set_state(bye_blackwind)
                end
        end
        state bye_blackwind begin
                when letter begin
                            send_letter("~Lv 40 - Omoara liderii vantului")
                            q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when info or button begin
                        say_title("Omoara liderii vantului")
                        say_verde("")
                        say_verde("Omoara liderii vantului, sunt foarte")
                        say_verde("nervosi si sunt un pericol pentru noi.")
                        say_verde("Acestia sunt: Jak-To, To-Su, Gu-Ryung.")

                end
                when 11004.chat."Omoara liderii vantului" with pc.level >=32 begin
                        say_title("Gardian")
                        say_verde("")
                        say_verde("Nu ai reusit, e prea mult pentru tine?")
                        local s=select("Mai incerc","E prea mult...")
                        if 2==s then
                                say_title("Gardian")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Gardian:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Gardian:")
                                say_verde("")
                                say_verde("Atunci, drum bun si cale batuta.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Gardian:")
                        say_verde("")
                        say_verde("Du-te si omoara liderii vantului.")
                end


                when 404.kill begin
                        pc.setqf("kill_m1",1)

                        if        pc.getqf("kill_m1")==1        and        pc.getqf("kill_m2")==1 and        pc.getqf("kill_m3")==1        then
                                set_state(hunt_reward)
                        end
                        return
                end
                when 405.kill begin
                                pc.setqf("kill_m2",1)

                                if        pc.getqf("kill_m1")==1        and        pc.getqf("kill_m2")==1 and        pc.getqf("kill_m3")==1        then
                                        set_state(hunt_reward)
                                end
                                return

                end

                when 406.kill begin
                        pc.setqf("kill_m3",1)

                        if        pc.getqf("kill_m1")==1        and        pc.getqf("kill_m2")==1 and        pc.getqf("kill_m3")==1        then
                                set_state(hunt_reward)
                        end
                        return

                end


        end

        state hunt_reward begin
                when letter begin
                            send_letter("~Lv 40 - Omoara liderii vantului")
                            q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v = find_npc_by_vnum(20355)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Inapoi la Capitan")
                        end
                end

                when info or button begin
                        say_title("Omoara liderii vantului")
                        say_verde("")
                        say_verde("Ai reusit, du-te inapoi la Capitan.")
                end

                when __TARGET__.target.click or
                        20355.chat."Omoara liderii vantului" begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Pacea a fost restaurata datorita tie.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("3.500.000 Puncte de experienta")
                        say_reward("200.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(3500000)
                        pc.change_money(200000)
                        pc.give_item2(50011,4)
                        set_quest_state("levelup","run")
                        set_state(__COMPLETE__)
                        clear_letter()
                end

                end
        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end