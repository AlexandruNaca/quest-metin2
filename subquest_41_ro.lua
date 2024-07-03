---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_41 begin
        state start begin
                when login or levelup with pc.level >= 49 and pc.level <= 51 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20008)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Reteta lui Octavio")
                        end
                end


                when __TARGET__.target.click or
                        20008.chat."Reteta lui Octavio" with pc.level >= 49 begin
                        target.delete("__TARGET__")

                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Am nevoie de 100 de ochi de paianjen")
                        say_verde("pentru o reteta speciala, acesti ochi")
                        say_verde("se pot obtine de la Paianjenii din desert.")
                        say_verde("")
                        say_verde("Vrei sa ma ajuti?")
                        local s=select("Sigur, te ajut","Nu am timp")
                        if 2==s then
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Octavio:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Du-te si omoara paianjenii din desert.")
                        set_state(hunt_for_oku)
                end
        end

        state hunt_for_oku begin
                when letter begin
                        send_letter("~Lv 49 - Reteta lui Octavio")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        if pc.count_item(30162) >= 100 then
                                local v = find_npc_by_vnum(20008)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Reteta lui Octavio")
                                end
                                return
                        end
                end

                when info or button begin

                        if pc.count_item(30162) >= 100 then
                                say_title("Reteta lui Octavio")
                                say_verde("")
                                say_verde("Ai obtinut cei 100 de ochi de paianjen,")
                                say_verde("acum intoarce-te cu ei la Octavio.")
                                return
                        end

                        say_title("Reteta lui Octavio")
                        say_verde("")
                        say_verde("Fa rost de 100 de ochi de paianjen")
                        say_verde("pentru reteta lui octavio de la")
                        say_verde("paianjenii din desertul Yongbi.")
                end
                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill begin
                        local s = number(1, 5)
                        if s <= 7 and pc.count_item(30162)<100  then
                                pc.give_item2(30162, 5)
                                if pc.count_item(30162)>=100 then
                                        local v=find_npc_by_vnum(20008)
                                        if 0==v then
                                        else
                                                target.vid("__TARGET__",v,"Inapoi la Octavio")
                                        end
                                end
                        end
                end

                when __TARGET__.target.click or
                        20008.chat."Reteta lui Octavio" begin
                        target.delete("__TARGET__")
                        if pc.count_item(30162) >= 100 then
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Esti incredibil, acum pot face reteta!")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("10.000.000 Puncte de experienta")
                                say_reward("390.000 Yang")
                                say_reward("x4 Cufar lumina lunii")
                                say_reward("x2 Marmura binecuvantata")
                                say_reward("x100 Mantia curajului")

                                pc.remove_item(30162,100)
                                pc.give_exp2(10000000)
                                pc.change_money(390000)
                                pc.give_item2(50011,4)
                                pc.give_item2(70024,2)
                                pc.give_item2(70038,100)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(COMPLETE)
                                return

                        else
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Nu ai toti ochii la tine, vrei sa")
                                say_verde("mai incerci sa faci rost de ei?")
                                local s=select("Mai incerc","Nu am timp")
                                if 2==s then
                                        say_title("Octavio:")
                                        say_verde("")
                                        say_verde("Pacat, o zi placuta in continuare.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Super, du-te si omoara paianjenii.")
                        end
                end
        end
        state __GIVEUP__ begin
        end

        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
end