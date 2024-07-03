---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_46 begin
        state start begin
                when login  or levelup with pc.level >= 53 and pc.level <= 56 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20005)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Secretul portelanului 2")
                        end
                end



                when __TARGET__.target.click or
                        20005.chat."Secretul portelanului 2" begin
                        target.delete("__TARGET__")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Am mai descoperit inca un material pentru")
                        say_verde("arta mea cu portelanul dar pentru asta am")
                        say_verde("nevoie de Nisip de desert, Sange de maimuta")
                        say_verde("si Minereu de cristal. Ma ajuti sa fac rost?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yonah:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Du-te si omoara Beduini pentru nisip")
                        say_verde("si maimute din desert pentru sange.")
                        set_state(to_get_material)
                end

        end


        state to_get_material begin
                when letter begin
                        send_letter("~Lv 53 - Secretul portelanului 2")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        if pc.count_item("50611")>0 and pc.count_item("30138")>0 and pc.count_item("30137")>0 then
                                local v = find_npc_by_vnum(20005)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Du-te la Yonah")
                                end
                        end


                end

                when button or info begin
                        if pc.count_item("50611") >= 1  and  pc.count_item("30137") >= 1 and pc.count_item("30138") >= 1 then
                                say_title("Secretul portelanului 2")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("")
                                say_verde("Ai obtinut toate materialele, acum")
                                say_verde("du-te si vorbeste cu Yonah.")
                                return
                        end

                        say_title("Secretul portelanului 2")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("")
                        say_verde("Yonah are nevoie de nisip de desert de")
                        say_verde("la Beduini, sange de maimuta de la")
                        say_verde("maimutele din desert si minereu de")
                        say_verde("cristal din minerit, se poate obtine")
                        say_verde("si cu ajutorul lui Doek-Bae.")


                end



                when 2108.kill  begin 
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30138")==0  then
                                pc.give_item2("30138", 1)

                                if pc.count_item("50611")>0 and pc.count_item("30137")>0 then
                                        local v = find_npc_by_vnum(20005)
                                        if v != 0 then
                                                target.vid("__TARGET__", v, "Du-te la Yonah")
                                        end
                                end
                        end

                end


                when 5125.kill or 5126.kill  begin 
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30137")==0  then
                                pc.give_item2("30137", 1)

                                if pc.count_item("50611")>0 and pc.count_item("30138")>0 then
                                        local v = find_npc_by_vnum(20005)

                                        if v != 0 then
                                                target.vid("__TARGET__", v, "Du-te la Yonah")
                                        end
                                end

                        end
                end


                when __TARGET__.target.click or
                        20005.chat."Secretul portelanului 2" with  pc.count_item("50611") >= 1  and  pc.count_item("30137") >= 1 and pc.count_item("30138") >= 1 begin
                                target.delete("__TARGET__")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Ai facut rost de toate materialele? Super!")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("10.000.000 Puncte de experienta")
                                say_reward("330.000 Yang")
                                say_reward("x5 Cufar lumina lunii")
                                say_reward("x10 Boabe zen")
                                pc.remove_item("50611",1)
                                pc.remove_item("30137",1)
                                pc.remove_item("30138",1)
                                pc.give_exp2(10000000)
                                pc.change_money(330000)
                                pc.give_item2(50011,5)
                                pc.give_item2(70102,10)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__THEEND__)



        end
end
        state __GIVEUP__ begin
        end
        state __THEEND__ begin
                when enter begin
                end
        end
end