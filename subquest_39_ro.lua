---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_39 begin
        state start begin
                when login or levelup or enter with pc.level >= 55 and pc.level <= 57 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20020)

                        if v != 0 then
                                target.vid("__TARGET2__", v, "Leacl pentru Balso")
                        end
                end


                when __TARGET2__.target.click or
                        20020.chat."Leacl pentru Balso" with pc.level >= 55 begin
                        target.delete("__TARGET2__")

                        say_title("Tradatorul Balso:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Ma simt groaznic, de cand am fost")
                        say_verde("exiltat... sanatatea mea sa inraugatit.")
                        wait()
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        say_verde("Este un doctor Baek-Go care s-ar putea")
                        say_verde("sa aibe un leac pentru boala mea, mergi")
                        say_verde("te rog sa vezi ce poti sa faci?")
                        local s=select("Sigur, ma duc","Nu am timp")
                        if 2==s then
                                say_title("Tradatorul Balso:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Tradatorul Balso:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Tradatorul Balso:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Baek-Go!")
                        set_state(ask_to_backgo)



                end
        end

        state ask_to_backgo begin
                when info or button begin
                        say_title("Leac pentru Balso")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Starea lui Balso de sanatate sa inrautatit.")
                        say_verde("")
                        say_verde("Du-te la Baek-Go si vorbeste cu el sa vezi")
                        say_verde("cum il puteti ajuta.")
                 end

                when letter begin
                        send_letter("~Lv 55 - Leac pentru Balso")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum("20018")
                        if 0== v then
                        else
                                target.vid("__TARGET2__",v,"Du-te la Baek-Go")
                        end
                end

                when __TARGET2__.target.click or
                        20018.chat."Leac pentru balso" begin
                        target.delete("__TARGET2__")
                        say_title("Baek-Go: ")
                        say_verde("")
                        say_verde("Il pot ajuta pe balso, dar am nevoie")
                        say_verde("de Iarba Maimutei Puternice de la")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Lordul Maimuta din desert, vrei sa")
                        say_verde("faci rost de aceasta iarba medicinala?")
                        local s=select("Desigur","Nu am timp")
                        if 2==s then
                                say_title("Baek-Go:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Baek-Go:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Baek-Go:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Du-te si omoara Lordul Maimuta")
                        set_state(hunt_monkey_boss)

                        end
                end

        state hunt_monkey_boss begin
                when letter begin
                        if pc.count_item(50059)>0 then
                                send_letter("~Lv 55 - Leac pentru Balso")
                                q.set_icon("scroll_open_golden.tga")
                                q.start()

                                local v=find_npc_by_vnum("20018")
                                if 0== v then
                                else
                                        target.vid("__TARGET2__",v,"Du-te la Baek-Go")
                                end

                                return
                        end
                        send_letter("~Lv 55 - Leac pentru Balso")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end
                when button or info begin
                        if pc.count_item(50059)>0 then
                                say_title("Leac pentru Balso")
                                say_verde("")
                                say_verde("Omoara Lordul Maimuta din desert pentru.")
                                say_verde("a obtine Iarba Maimutei Puternice.")
                                return
                        end
                        say_title("Leac pentru Balso")
                        say_verde("")
                        say_verde("Ai obtinut iarba, du-te la Baek-Go.")
                        say_item_vnum(50059)
                end
                when __TARGET2__.target.click or
                        20018.chat."Leac pentru Balso" with pc.count_item(50059) ==0 begin
                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Nu ai iarba, mai incerci sa faci rost?")
                        local s=select("Sigur, mai incerc", "Nu am timp")
                        if 2==s then
                                say_title("Baek-Go:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local s=select("Da, vreau", "Inchide.")
                                if 1==s then
                                        say_title("Baek-Go: ")
                                        say_verde("")
                                        say_verde("Esti un suflet crud, la revedere.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Baek-Go: ")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                return
                        end
                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Du-te si omoara Lordul Maimutei!")
                        say_verde("")
                        return
                end

                when 5161.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("50059")==0 then
                                pc.give_item2(50059, 1)

                        end
                end


                when __TARGET2__.target.click or
                        20018.chat."Leac pentru Balso" with pc.count_item(50059)>=1 begin
                        target.delete("__TARGET__")
                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Ai facut rost de Iarba Maimutei Puternice?")
                        say_verde("")
                        say_verde("Perfect, poftim, cu ajutorul acestei plante")
                        say_verde("am facut acest Leac care il va ajuta pe")
                        say_verde("Balso, du-te si dai-l de indata.")
                        pc.remove_item(50059,1)
                        pc.give_item2(30152,1)
                        set_state(go_to_patient)
                end
        end

        state go_to_patient begin
                when letter begin
                        send_letter("~Lv 55 - Leac pentru Balso")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20020)
                        if v != 0 then
                                target.vid("__TARGET2__",v,"Du-te la Balso")
                        end
                end

                when info or button begin
                        say_title("Leac pentru Balso")
                        say_verde("")
                        say_verde("Ai obtinut Leacul, du-te la Balso.")
                end

                when __TARGET2__.target.click or 20020.chat."Am obtinut Leacul" with pc.count_item(30152) > 0  begin
                        target.delete("__TARGET2__")
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        say_verde("Mi-ai salvat viata, multumesc din inima.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("20.000.000 Puncte de experienta")
                        say_reward("450.000 Yang")
                        say_reward("x5 Cufar lumina lunii")
                        say_reward("x1 Inelul experientei")
                        
                        pc.remove_item(30152,1)
                        pc.give_item2(50011,5)
                        pc.give_item2(70005,1)
                        pc.change_money(450000)
                        pc.give_exp2(20000000)
                        set_quest_state("levelup","run")
                        set_state(COMPLETE)
                        clear_letter()
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