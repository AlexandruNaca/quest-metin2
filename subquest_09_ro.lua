---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_9 begin
        state start begin
                when login or levelup with pc.level >= 16 and pc.level <= 21 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20016)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Gaseste securea de aur")
                        end
                end


                when __TARGET__.target.click or
                        20016.chat."Gaseste securea de aur" with pc.level >= 16 begin
                        target.delete("__TARGET__")

                        say_title("Fierar:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("I-am promis prietenului meu Deokbae ca")
                        say_verde("o sa ii produc o secure de aur, dar nu")
                        say_verde("am reusit. Imi faci tu rost de una?")

                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Fierar:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit!")
                                        return
                                end
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Cum vrei, lasa ca nu te uit eu.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Super, multumesc. Poti sa faci rost")
                        say_verde("de secure omorand juramantul alb.")
                        set_state(hunt_for_goldenaxe)

                end
        end

        state hunt_for_goldenaxe begin
                when letter begin
                        send_letter("~Lv 16 - Gaseste securea de aur")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when info or button begin
                	if pc.count_item(30102) == 0 then
				say_title("Gaseste securea de aur")
				say_verde("")
				say_verde("Omoara juramantul alb ca sa obtii o")
				say_verde("secure de aur pentru fierar.")
				say_item_vnum(30102)
			else
				say_title("Gaseste securea de aur")
				say_verde("")
				say_verde("Ai obtinut securea, du-te la fierar.")
				say_verde("")
			end
                end

                when 301.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30102)==0  then
                                pc.give_item2(30102, 1)
                                send_letter("~Lv 16 - Ai gasit securea de aur")
                                q.set_icon("scroll_open_golden.tga")

                                local v=find_npc_by_vnum(20016)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Inapoi la Fierar")
                                end
                        end
                end

                when 20016.chat."Poftim securea de aur" begin
                        target.delete("__TARGET__")
                        if pc.count_item(30102) >= 1 then
                                say_title("Fierar:")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("")
                                say_verde("Multumesc, m-ai salvat, crede-ma.")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("60.000 Puncte de experienta")
                                say_reward("40.000 Yang")
                                say_reward("x2 Cufar lumina lunii")
                                pc.give_exp2(60000)
                                pc.change_money(40000)
                                pc.give_item2(50011, 2)

                                pc.remove_item(30102)
                                set_quest_state("levelup","run")
                                q.done()
                                set_state(__COMPLETE__)
                                return
                        else
                                say_title("Fierar:")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("")
                                say_verde("Nu ai securea de aur la tine.")
                        end --if
                end  --when
        end  --state
        state __GIVEUP__ begin
        end

        state __COMPLETE__ begin
        end
end