---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_45 begin
        state start begin
                when login or levelup with pc.level >= 60  and pc.level <= 62  begin
                        set_state(enter)
                end
        end

        state enter  begin
                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Soon")
                        end
                end

                when __TARGET__.target.click or
                 20023.chat."Templul secret" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Razboinicule, am nevoie de 3 obiecte")
                        say_verde("magice din templul hwang, este vorba")
                        say_verde("de Fularul din templu, Invatatura din")
                        say_verde("templu si Traducere cartea blestem.")
                        say_verde("")
                        say_verde("Faci rost de aceste obiecte pentru mine?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Omoara Vrajitor intunecat mandru")
                        say_verde("pana obti cele 3 obiecte magice.")
                        set_state(WHAT_IS_MILGYO)

                end

        end


        state WHAT_IS_MILGYO begin

                when letter begin

                        send_letter("~Lv 60 - Templul secret")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        if pc.count_item("30147")>=1 and pc.count_item("30148")>=1  and  pc.count_item("30164")>=1 then
                                local v=find_npc_by_vnum(20023)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Du-te la Soon")
                                end
                        end

                end

                when info or  button begin

                        if pc.count_item("30147")>=1 and pc.count_item("30148")>=1  and  pc.count_item("30164")>=1 then
                                say_title("Templul secret")
                                say_verde("")
                                say_verde("Ai obtinut cele 3 obiecte magice, acum")
                                say_verde("du-te si vorbeste cu Soon.")
                                return
                        end

                        say_title("Templul secret")
                        say_verde("")
                        say_verde("Soon are nevoie de Fularul din templu,")
                        say_verde("Invatatura din templu si Traducere")
                        say_verde("carte blestem, le poti obtine omorand")
                        say_verde("Vrajitor intunecat mandru in templu.")


                end

                when 737.kill  begin

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30147")==0  then
                                pc.give_item2(30147, 1)
                                return
                        end

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30148")==0  then
                                pc.give_item2(30148, 1)
                                return
                        end

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30164")==0  then
                                pc.give_item2(30164, 1)
                                return
                        end

                end


                when __TARGET__.target.click or
                        20023.chat."Templul secret" begin
                        if pc.count_item("30147")>0 and pc.count_item("30148")>0  and  pc.count_item("30164")>0 then
                                target.delete("__TARGET__")
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Ai facut rost de cele 3 obiecte magice?")
                                say_verde("Uau, multumesc mult, chiar esti puternic.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("25.000.000 Puncte de experienta")
                                say_reward("500.000 Yang")
                                say_reward("x6 Cufar lumina lunii")
                                say_reward("x5 Piatra spiritului")
                                pc.remove_item("30148",1)
                                pc.remove_item("30147",1)
                                pc.remove_item("30164",1)
                                pc.give_exp2(25000000)
                                pc.change_money(500000)
                                pc.give_item2(50011,6)
                                pc.give_item2(70024)
                                pc.give_item2(50513,5)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(COMPLETE)



                                return
                        else
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Ce? Nu ai cele 3 obiecte magice?")
                                say_verde("Of.. Mergi sa mai incerci din nou?")
                                local s=select("Sigur, mai incerc","Nu am timp" )
                                if 2==s then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Esti un las, hai lasa-ma sa citesc.")
                                        set_state(__GIVEUP__)
                                        return
                                end

                                say_title("Soon:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")

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