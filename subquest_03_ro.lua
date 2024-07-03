---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_3 begin
        state start begin
                when login or levelup with pc.level >= 8 and pc.level <= 13 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20018)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Medicamentul")
                        end
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        say_title("Baek-Go:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ma ajuti te rog frumos? De cand au inceput")
                        say_verde("sa cada pietrele metin, multi sateni s-au")
                        say_verde("ranit. Eu incerc sa ii ajut dar am nevoie")
                        say_verde("sa produc un medicament pentru raniile lor.")
                        wait()

                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Am nevoie de un ficat de lup pentru aceste")
                        say_verde("medicamente, te rog du-te si omoara Lupi")
                        say_verde("albastri si adu-mi acest ficat vindecator.")
                        say_item_vnum(30029)

                        set_state(hunt_for_wolf)
                end
        end

        state hunt_for_wolf begin
                when letter begin
                        send_letter("~Lv 8 - Medicamentul")
                        q.set_icon("scroll_open_golden.tga")
                end
                when button or info begin
                        say_title("Medicamentul")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Baek-Go are nevoie de un ficat de lup, el")
                        say_verde("vrea sa faca un medicament cu acesta.")
                        say_item_vnum(30029)
                        say_verde("Omoara lupii albastri pentru a-l obtine.")
                end

            when 20018.chat."De unde iau ficat de lup?" with pc.count_item(30029) == 0 begin
                        say_title("Baek-Go:")
                        say_verde("")
                        say_verde("Il poti obtine de la lupii albastri.")
                        say_item_vnum(30029)
                end


                when 104.kill begin
                        local s = number(1, 40)
                        if s <= 5 then
                                pc.give_item2("30029", 1)
                                set_state(go_back_to_doctor)
                        end
                end

        end

    state go_back_to_doctor begin
                when letter begin
                        send_letter("~Lv 8 - Inapoi la Baek-Go")
                        q.set_icon("scroll_open_golden.tga")
                        local v = find_npc_by_vnum(20018)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Inapoi la Baek-Go.")
                        end
                end
                when button or info begin
                        say_title("Inapoi la Baek-Go")
                        say_verde("")
                        say_verde("Ai gasit ficatul de lup, du-te Baek-Go.")
                end

                when __TARGET__.target.click begin                        
                        if pc.count_item(30029) > 0 then
                target.delete("__TARGET__")
				say_title("Baek-Go:")
				say_verde("")
				say_verde("Multumesc, acum pot sa produc medicamentul")
				wait()
				say_title("Baek-Go:")
				say_verde("")
				say_verde("Poftim, tine asta din partea mea.")
				say_verde("")
				say_title("Recompensa:")
				say_reward("6.000 Puncte de experienta")
				say_reward("10.000 Yang")
				say_reward("x1 Cufar lumina lunii")

				pc.remove_item(30029)
				pc.give_exp2(6000)
				pc.change_money(10000)
				pc.give_item2(50011)
                set_quest_state("levelup","run")

				clear_letter()
				set_state(__COMPLETE__)
                        else
				say_title("Baek-Go:")
				say_verde("")
				say_verde("Ai pierdut ficatul de lup? Of, du-te")
				say_verde("inapoi si incearca sa mai obtii unul.")
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end