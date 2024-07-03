---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_48  begin
        state start begin
                when login or levelup with pc.level >= 58 and pc.level <= 60 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Capitan")
                        end
                end

                when __TARGET__.target.click or
                        20355.chat."Spionul din regate"  begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Nu de curand am infilitrat spioni in")
                        say_verde("tinuturile inamicilor nostri, acum avem")
                        say_verde("nevoie sa vedem roadele spionajului.")
                        say_verde("")
                        say_verde("Esti in stare sa colectezi informatiile?")
                        local r=select("Sunt in stare", "Mi-e frica")
                        if 2==r then
                                say_title("Capitan")
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
                        say_verde("Du-te la pescar si vorbeste cu el.")
                        set_state(go_to_otherland)

                end
        end
        state go_to_otherland begin
                when letter begin
                        send_letter("~Lv 58 - Spionul din regate")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()


                end

                function is_other_vil()
                        local empire = pc.get_empire()
                        local map_num= pc.get_map_index()

                        local is_village = 0

                        if empire == 1 and map_num == 41 then is_village = 1 end
                        if empire == 2 and map_num ==  1 then is_village = 1 end
                        if empire == 3 and map_num == 21 then is_village = 1 end
                        return is_village
                end

                when info or button begin
                        local empire = pc.get_empire()

                        if empire==1 then
                                say_title("Spionul din regate")
                                say_verde("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("Du-te si vezi daca Pescarul a obtinut ceva")
                                say_verde("informatii de la spionii din celelalte regate.")

                        elseif  empire ==2 then
                                say_title("Spionul din regate")
                                say_verde("")
                                say_verde("Du-te si vezi daca Pescarul a obtinut ceva")
                                say_verde("informatii de la spionii din celelalte regate.")

                        elseif  empire ==3 then
                                say_title("Spionul din regate")
                                say_verde("")
                                say_verde("Du-te si vezi daca Pescarul a obtinut ceva")
                                say_verde("informatii de la spionii din celelalte regate.")

                        end
        end



                when __TARGET__.target.click or
                         9009.chat."Ai gasit informatiile?" begin
                         target.delete("__TARGET__")
                         say_title("Pescar:")
                         say_verde("")
                         ----"12345678901234567890123456789012345678901234567890"|
                         say_verde("In timp ce pescuiam am gasit o sticla")
                         say_verde("cu un mesaj de la un spion din alt regat.")
                         say_verde("Du-te cu mesajul la capitan urgent!")
                         say_verde("")
                         say_verde("Tine si aceste licori mov, grabeste-te!")
                         pc.give_item2(27105,5)
                         set_state(back_to_boss)
                         end
        end


state back_to_boss begin
        when letter begin
                        send_letter("~Lv 58 - Inapoi la Capitan")
                        q.set_icon("scroll_open_golden.tga")

                        if subquest_48.is_my_vil()==1  then
                                local v=find_npc_by_vnum(20355)
                                if 0==v then
                                else
                                        target.vid("__TARGET__", v, "Inapoi la Capitan")
                                end
                        end

                end
                when info or button begin
                        local empire = pc.get_empire()

                        if empire==1 then  --Pandemonia
                                say_title("Intalneste spionul")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("")
                                say_verde("Intoarce-te inapoi la Capitan si raporteaza.")

                        elseif  empire ==2 then --Asmodia
                                say_title("Intalneste spionul")
                                say_verde("")
                                say_verde("Intoarce-te inapoi la Capitan si raporteaza.")

                        elseif  empire ==3 then  --Elgoria
                                say_title("Intalneste spionul")
                                say_verde("")
                                say_verde("Intoarce-te inapoi la Capitan si raporteaza.")
                        end

                end

                        function is_my_vil()
                        local empire = pc.get_empire()
                        local map_num= pc.get_map_index()

                        local is_village = 0

                        if empire == 1 and map_num == 1 then is_village = 1 end
                        if empire == 2 and map_num == 21 then is_village = 1 end
                        if empire == 3 and map_num == 41 then is_village = 1 end
                        return is_village
                end



                when __TARGET__.target.click or
                        20355.chat."Am intalnit spionul!"  with subquest_48.is_my_vil() ==1 begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Ma bucur ca esti in viata! Bravo!")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("20.000.000 Puncte de experienta")
                        say_reward("490.000 Yang")
                        say_reward("x5 Cufar lumina lunii")
                        say_reward("x10 Boabe zen")
                        pc.give_exp2(20000000)
                        pc.change_money(490000)
                        pc.give_item2(50011,5)
                        pc.give_item2(70102,10)
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