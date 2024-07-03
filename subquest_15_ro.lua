---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_15 begin
        state start begin
                when login or levelup or enter with pc.get_level() >= 23  and pc.get_level() <= 28 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum=11000
                        elseif pc.get_empire() == 2 then
                                vnum=11002
                        elseif pc.get_empire() == 3 then
                                vnum=11004
                        end

                        local v = find_npc_by_vnum(vnum)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Omoara-l pe Eun-Jung")
                        end
                end


                when __TARGET__.target.click or
                        11000.chat."Omoara-l pe Eun-Jung" or
                        11002.chat."Omoara-l pe Eun-Jung" or
                        11004.chat."Omoara-l pe Eun-Jung" with pc.level >= 23 begin
                        target.delete("__TARGET__")

                        say_title("Gardian:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Vin putin aici, am nevoie de tine din nou.")
                        say_verde("")
                        say_verde("Poti sa mergi sa il omori pe Eun-Jung?")
                        local s=select("Sigur, ma duc","Nu am timp")
                        if 2==s then
                                say_title("Gardian:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Gardian:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Gardian:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Gardian:")
                        say_verde("")
                        say_verde("Multumesc, du-te si omoara juramantul alb!")
                        set_state(hunt_eunjung)
                end
        end

        state hunt_eunjung begin
                when letter begin
                        send_letter("~Lv 23 - Omoara-l pe Eun-Jung")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when button or info begin
                        say_title("Omnoara-l pe Eun-Jung")
                        say_verde("")
                        say_verde("Du-te si omoara juramantul alb!")
                end

                when 392.kill begin
                        set_state(hunt_reward)
                end
        end

        state hunt_reward begin
                when letter begin
                        send_letter("~Lv 23 - Inapoi la Gardian")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when letter begin
                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum=11000
                        elseif pc.get_empire() == 2 then
                                vnum=11002
                        elseif pc.get_empire() == 3 then
                                vnum=11004
                        end

                        local v = find_npc_by_vnum(vnum)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Inapoi la Gardian")
                        end
                end

                when info or button begin
                        say_title("Inapoi la Gardian")
                        say_verde("")
                        say_verde("Ai omorat pe Eun-Jung, du-te la Gardian.")
                end

                when __TARGET__.target.click or
                        11000.chat."Am omorat Eun-Jung" or
                        11002.chat."Am omorat Eun-Jung" or
                        11004.chat."Am omorat Eun-Jung" begin
                        target.delete("__TARGET__")
                        say_title("Guardian:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, satenii sunt mult mai linistiti acum!")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("600.000 Puncte de experienta")
                        say_reward("80.000 Yang")
                        say_reward("x3 Cufar lumina lunii")
                        say_reward("x1 Colier de aur+4")
                        say_reward("x1 Cercei de aur+4")
                        say_reward("x1 Bratara de aur+4")
                        pc.give_exp2(600000)
                        pc.change_money(80000)
                        pc.give_item2(50011, 3)
                        pc.give_item2(16064)
                        pc.give_item2(17064)
                        pc.give_item2(14064)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
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