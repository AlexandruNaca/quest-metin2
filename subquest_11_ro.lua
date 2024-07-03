---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_11 begin
        state start begin
                when login or  levelup with pc.level >= 19 and pc.level <= 24 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20006)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Fratele lui Mirine")
                        end
                end


                when __TARGET__.target.click or
                        20006.chat."Fratele lui Mirine" with pc.level >= 19 begin
                        target.delete("__TARGET__")

                        say_title("Mirine:")
                        say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Nu am mai auzit nimic de la fratele")
                        say_verde("meu si sunt ingrijorata, ultima data")
                        say_verde("a fost in vizita la Yu-Hwan, mergi te")
                        say_verde("rog pana acolo sa vezi cum sta treaba? ")

                        local s=select("Sigur, ma duc","Nu am timp")
                        if 2==s then
                                say_title("Mirine:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                say_title("Mirine:")
                                                say_verde("")
                                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                                return
                                        end
                                        say_title("Mirine:")
                                        say_verde("")
                                        say_verde("Ce suflet rau poti sa ai, pleaca!")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Mirine:")
                                say_verde("")
                                say_verde("Multumesc ca ma ajuti, acum du-te.")
                                set_state(find_brother)

                end
        end

        state find_brother begin
                when letter begin
                        send_letter("~Lv 19 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v= find_npc_by_vnum(20017)
                        if 0==v then
                        else
                                target.vid("__TARGET1__",v,"Du-te la Yu-Hwan")
                        end

                end

                when info or button begin
                        say_title("Fratele lui Mirine")
                        say_verde("")
                        say_verde("Du-te si intreaba-l pe Yu-Hwan despre")
                        say_verde("fratele lui Mirine, e ingrijorata.")
                end

                when __TARGET1__.target.click or
                        20017.chat."Fratele lui Mirine" begin
                        target.delete("__TARGET1__")
                        say_title("Yu-Hwan:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Fratele lui Mirine? Cand am vorbit")
                        say_verde("ultima data a zis ca merge pe munte")
                        say_verde("sa caute plante rare. Vorbeste cu")
                        say_verde("Yang-Shin, el mai merge pe acolo.")

                        set_state(ask_to_hunter)
                end
        end

        state ask_to_hunter begin
                when letter begin
                        send_letter("~Lv 19 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v= find_npc_by_vnum(20019)
                        if 0==v then
                        else
                                target.vid("__TARGET2__",v,"Du-te la Yang-Shin")
                        end

                end

                when info or button begin
                        say_title("Fratele lui Mirine")
                        say_verde("")
                        say_reward("Du-te si vorbeste cu Yang-Shin.")
                end

                when  __TARGET2__.target.click or
                        20019.chat."Fratele lui Mirine" begin
                        target.delete("__TARGET2__")
                        say_title("Yang-Shin:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Fratele lui Mirine? A plecat pe munte")
                        say_verde("sa caute ginseng ca sa vanda pe Yang.")
                        say_verde("")
                        say_verde("A lasat o scrisoare inainte sa mearga,")
                        say_verde("uite. Dute cu ea la sora lui, Mirine.")

                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        send_letter("~Lv 19 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v= find_npc_by_vnum(20006)
                        if 0==v then
                        else
                                target.vid("__TARGET3__",v,"Inapoi la Mirine")
                        end

                end

                when info or button begin
                        say_title("Fratele lui Mirine")
                        say_verde("")
                        say_verde("Intoarce-te inapoi la Mirine.")
                end

                when __TARGET3__.target.click or
                        20006.chat."Fratele lui Mirine" begin
                        target.delete("__TARGET3__")
                        say_title("Mirine:")
                        say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, o scrisoare de la fratele meu, ce")
                        say_verde("bine. M-am ingrijorat, multumesc mult.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("100.000 Puncte de experienta")
                        say_reward("60.000 Yang")
                        pc.give_exp2(100000)
                        pc.change_money(60000)
                        local r = number(1,2)
                        if r == 1 then
				if pc.get_job() == 0 or pc.get_job() == 1 then
                                        say_reward("x2 Cufar lumina lunii")
					pc.give_item2(50011, 2)
				else
					say_reward("x1 Cufar lumina lunii")
					pc.give_item2(50011)
				end
			else

			end
                        q.done()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin
        end

        state __COMPLETE__ begin
        end
end