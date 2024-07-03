---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_30 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=33  and pc.get_level() <= 35 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20016)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Du-te la Fierar")
                        end
                end


                when __TARGET__.target.click or
                        20016.chat."Fabricarea armelor" with pc.level >= 33 begin
                        target.delete("__TARGET__")
                        say_title("Fierar:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Am nevoie de 100 minereu de aur, 100 de")
                        say_verde("minereu de argint si 100 de minereu de")
                        say_verde("abanos pentru fabricarea armelor noi.")
                        say_verde("")
                        say_verde("Daca imi faci rost, te v-oi rasplati!")
                        local s=select("Iti fac rost","Du-te ma de aici")
                        if 2==s then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Fierar:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Du-te si fa rost de materiale!")
                        set_state(to_gain_material)
                end
        end

        state to_gain_material begin

                when letter begin
                send_letter("~Lv 33 - Materiale pentru fierar")
                q.set_icon("scroll_open_golden.tga")

                        local gold=pc.count_item(50606)
                        local silver=pc.count_item(50605)
                        local ebony=pc.count_item(50608)

                        if        gold>=100  and silver>=100 and ebony>=100 then
                                local v = find_npc_by_vnum(20016)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Du-te la Fierar")
                                end
                                return
                        end

                end

                when info or button begin
                        local gold=pc.count_item(50606)
                        local silver=pc.count_item(50605)
                        local ebony=pc.count_item(50608)

                        if        gold>=100  and silver>=100 and ebony>=100 then

                                say_title("Materiale pentru fierar")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Ai obtinut toate materialele necesare,")
                                say_verde("du-te cu ele la fierar.")
                                return
                        end

                        say_title("Materiale pentru fierar")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Fierarul are nevoie de 100 minereu de")
                        say_verde("aur, 100 de minereu de argint si 100")
                        say_verde("de minereu de abanos.")
                end

                when __TARGET__.target.click or
                        20016.chat."Materiale pentru fierar" begin
                        target.delete("__TARGET__")

                        local gold = pc.count_item(50606)
                        local silver = pc.count_item(50605)
                        local ebony = pc.count_item(50608)


                        if        gold<100 or silver<100 or ebony<100 then

                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Nu ai toate materialele necesare!")

                                local s=select("O sa le obtin","Nu mai am timp")
                                if 2==s then
                                say_title("Fierar")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                        local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                say_title("Fierar")
                                                say_verde("")
                                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                                return
                                        end
                                        say_title("Fierar:")
                                        say_verde("")
                                        say_verde("Pacat, tu ai de pierdut, nu eu.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Fierar:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Du-te si fa rost de materiale!")
                end

                if        gold>=100  and silver>=100 and ebony>=100 then

                        say_title("Fierar:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Da! Acum am toate materialele necesare!")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("3.000.000 Puncte de experienta")
                        say_reward("120.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(3000000)
                        pc.change_money(120000)
                        pc.give_item2(50011, 4)
                        pc.remove_item(50606,100)
                        pc.remove_item(50605,100)
                        pc.remove_item(50608,100)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end

                end
        end
state __GIVEUP__ begin
end
state __COMPLETE__ begin
        when enter begin
        end
end
end