---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_19  begin
        state start begin
                when login or levelup with pc.level >= 12  and pc.level <=17 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(9006)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Batrana")
                        end
                end

                when __TARGET__.target.click or 9006.chat."Procura blana de lup" begin
                        target.delete("__TARGET__")
                        say_title("Batrana:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("*Cough* *Cough* Oh draga, praful acesta")
                        say_verde("imi strica sanatatea si nu am nimic cu")
                        say_verde("ce sa curat prin casa si afara.")
                        say_verde("")
                        say_verde("Nu imi faci tu rost de o blana de lup?")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Batrana:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Batrana:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Batrana:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Batrana:")
                        say_verde("")
                        say_verde("Du-te si omoara Lupii gri flamanzi.")
                        set_state(find)
                end
        end
        state find begin
                when letter begin
                        send_letter("~Lv 12 - Ajutor pentru batrana")
                        q.set_icon("scroll_open_golden.tga")
                end
                when info or button begin
                        say_title("Ajutor pentru batrana")
                        say_verde("")
                        say_verde("Omoara Lupii gri flamanzi ca sa obtii o")
                        say_verde("blana de lup pentru sarmana batrana.")
                end

                when 176.kill begin
                        local s = number(1, 50)
                        if s <= 5 and pc.count_item(30151)==0  then
                                pc.give_item2(30151, 1)
                                local v=find_npc_by_vnum(9006)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Du-te la batrana")
                                end
                        end
                end

                when 9006.chat."Procura blana de lup" with pc.count_item("30151") == 0 begin
                       say_title("Batrana:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("*Cough* *Cough* Oh draga, praful acesta")
                        say_verde("imi strica sanatatea si nu am nimic cu")
                        say_verde("ce sa curat prin casa si afara.")
                        say_verde("")
                        say_verde("Nu imi faci tu rost de o blana de lup?")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Batrana:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Batrana:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Batrana:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Batrana:")
                        say_verde("")
                        say_verde("Du-te si omoara Lupii gri flamanzi.")

                 end


                when __TARGET__.target.click or
                        9006.chat."Am facut rost de blana" with pc.countitem("30151")>=1 begin
                        target.delete("__TARGET__")
                        say_title("Batrana:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, in sfarsit pot sa curat praful.")
                        pc.removeitem(30151, 1)
                        setstate(reward)
                end
        end
        state reward begin
                when letter begin
                        send_letter("~Lv 12 - Recompensa batranei")
                        q.set_icon("scroll_open_golden.tga")
                end
                when info or button begin
                        say_title("Recompensa batranei")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("20.000 Puncte de experienta")
                        say_reward("30.000 Puncte de experienta")
                        pc.give_exp2(20000)
                        pc.change_money(30000)
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