---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_8 begin
        state start begin
                when login or levelup with pc.level >= 15 and pc.level <= 20 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20003)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Placinta cu orez")
                        end
                end


                when __TARGET__.target.click or
                        20003.chat."Placinta cu orez" with pc.level >= 15 begin
                        target.delete("__TARGET__")

                        say_title("Ah-Yu:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Scuza-ma, daca ai putin timp liber ai")
                        say_verde("putea sa ma ajuti? Copilul meu plange")
                        say_verde("intruna... Il pot linisti cu placinta")
                        say_verde("de orez, dar nu am acum... faci tu rost")
                        say_verde("pentru mine? Te v-oi rasplati in schimb.")

                        local s=select("Te ajut","Nu am timp")
                        if 2==s then
                                say_title("Ah-Yu:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ah-Yu:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ah-Yu:")
                                say_verde("")
                                say_verde("Ok. Multumesc pentru timpul tau.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ah-Yu:")
                        say_verde("")
                        say_verde("Vai multumesc ca ma ajuti, haide")
                        say_verde("grabeste-te, of, saracul copilas.")
                        say_verde("")
                        set_state(ask_for_ricecake)

                end
        end

        state ask_for_ricecake begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(9001)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v, "Du-te la negustorul de arme")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Intreaba-l pe negustorul de arme despre")
                        say_verde("cum poti face rost de placinta cu orez.")
                end

                when __TARGET__.target.click or
                        9001.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Weapon Shop Dealer:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ce? Placinta cu orez? E un fel de arma?")
                        say_verde("Ti se pare ca eu ma ocup cu asa ceva?")
                        say_verde("")
                        say_verde("Eventual du-te si vorbeste cu Octavio.")

                        set_state(ask_for_ricecake2)
                end
        end

        state ask_for_ricecake2 begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v= find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te Octavio.")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Intreaba-l pe Octavio despre placinta.")
                end

                when __TARGET__.target.click or
                        20008.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Octavio:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Vrei placinta cu orez? Of, chiar acum")
                        say_verde("nu am deloc pe stoc, dar poti sa mergi")
                        say_verde("la Yu-Rang si sa cumperi de la ea.")
                        local s=select("Ok, am inteles","Nu am timp")
                        if 2==s then
                                say_title("Octavio:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Octavio:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("De ce te-ai mai obosit sa ma intrebi?")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Ok, Yu-Rang este in satul vecin.")
                        set_state(ask_for_ricecake3)
                end
        end

        state ask_for_ricecake3 begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Yu-Rang")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Du-te la Yu-Rang si obtine o placinta.")
                end

                when __TARGET__.target.click or
                        20012.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("")
                        say_verde("Vrei placinta cu orez? Sigur, am sa iti")
                        say_verde("dau daca vorbesti cu Taurean, se tot ia")
                        say_verde("de mine fara motiv si ma cam enerveaza.")

                        set_state(ask_for_ricecake4)
                end
        end

        state ask_for_ricecake4 begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20014)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Taurean.")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_reward("Du-te si vorbeste cu Taurean.")
                end


                when __TARGET__.target.click or
                        20014.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ce? Eu nu ma iau de Yu-Rang, ea se tot")
                        say_verde("ia de mine, spune-i sa ma lase in pace.")

                        set_state(report_to_girl)
                end
        end

        state report_to_girl begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v, "Inapoi la Yu-Rang")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Intoarcete inapoi la Yu-Rang.")
                end


                when __TARGET__.target.click or
                        20012.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Ce? De ce minte in halul asta? Of")
                        say_verde("lasa ca o sa vorbesc eu cu Capitanul.")
                        say_verde("")
                        say_verde("Multumesc oricum, poftim placinta cu orez.")
                        pc.give_item2(30158, 1)
                        set_state(reward_go)
                end
        end

        state reward_go begin
                when letter begin
                        send_letter("~Lv 15 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Inapoi la Ah-Yu")
                        end

                end

                when info or button begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Ai obtinut placinta, intoarcete la Ah-Yu.")
                end

                when __TARGET__target.click or 20003.chat."Placinta cu orez" begin
                        target.delete("__TARGET__")
                        say_title("Ah-Yu:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Vai, multumesc mult, asta il va linisti.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("30.000 Puncte de experienta")
                        say_reward("30.000 Yang")
                        say_reward("x2 Cufar lumina lunii")
                        pc.remove_item(30158)
                        pc.give_exp2(30000)
                        pc.change_money(30000)
                        pc.give_item2(50011, 2)
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