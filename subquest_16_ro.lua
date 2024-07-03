---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_16 begin
        state start begin
                when login or levelup or enter with pc.level >= 25 and pc.level <= 30 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20355)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Cavalerie blindata")
                        end
                end


                when __TARGET__.target.click or
                        20355.chat."Cavaleria blindata" with pc.level >= 25 begin
                        target.delete("__TARGET__")

                        say_title("Capitan:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Yu-Hwan are informatii despre cavaleria")
                        say_verde("blindata, te duci pana acolo sa afli?")
                        local s=select("Sigur, ma duc","Nu am timp")
                        if 2==s then
                                say_title("Capitan:")
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
                        say_verde("Multumesc, du-te cat de repede poti!")
                        set_state(ask_to_yuhwan)



                end
        end

        state ask_to_yuhwan begin
                when info or button begin
                        say_title("Cavaleria blindata")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Capitan a zis ca Yu-Hwan are informatii")
                        say_verde("noi despre cavaleria blindata, du-te la el.")
                end

                when letter begin
                        send_letter("~Lv 25 - Du-te la Yu-Hwan")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20017)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Yu-Hwan")
                        end
                end

                when 20017.chat."Cavaleria blindata" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Da, am informatii despre cavaleria blindata.")
                        say_verde("")
                        say_verde("Dar mai bine ai vorbi cu Negustorul ambulant.")
                        set_state(ask_to_peddler)
                end
        end

        state ask_to_peddler begin
                when letter begin
                        send_letter("~Lv 25 - Du-te la Negustor")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20010)
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Du-te la Negustor")
                        end
                end

                when info or button begin
                        say_title("Du-te la Negustor")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Yu-Hwan a zis ca mai bine ai vorbi cu")
                        say_verde("negustorul ambulant, du-te la el.")
                end


                when 20010.chat."Cavaleria blindata" begin
                        target.delete("__TARGET1__")
                        say_title("Negustor ambulant")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Cavaleria blindata? Sigur ca stiu despre")
                        say_verde("ea. Am toate informatiile necesare la mine.")
                        say_verde("")
                        say_verde("Tine pergamentul acesta, du-l la Uriel.")
                         set_state(ask_to_uriel)
                end
        end
        state ask_to_uriel begin
                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Du-te la Uriel")
                        end

                        send_letter("~Lv 25 - Du-te la Uriel")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()
                end

                when info or button begin
                        say_title("Du-te la Uriel")
                        say_verde("")
                        say_verde("Du pergamentul de la negustor la Uriel." )
                end



                when 20011.chat."Cavaleria blindata" begin
                        target.delete("__TARGET1__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Uriel: ")
                        say_verde("")
                        say_verde("Ah! Pergamentul acesta are toate informatiile")
                        say_verde("despre cavaleria blindata, Capitanul va fi")
                        say_verde("foarte multumit de munca ta, du-te la el.")
                        set_state(ask_to_guard)
                end
        end

        state ask_to_guard begin
                when info or button begin
                        say_title("Du-te la Capitan")
                        say_verde("")
                        say_verde("Ai obtinut toate informatiile necesare.")
                        say_verde("Acum du-te si vorbeste cu Capitanul.")
                end

                when letter begin
                        send_letter("~Lv 25 - Du-te la Capitan")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20355)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Capitan")
                        end
                end

                when 20355.chat."Cavaleria blindata" begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Sunt foarte multumit de antrenamentul si")
                        say_verde("rezultatele tale, ai devenit puternic si")
                        say_verde("un luptator de incredere, felicitarile mele.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("700.000 Puncte de experienta")
                        say_reward("90.000 Yang")
                        say_reward("x3 Cufar lumina lunii")
                        pc.give_exp2(700000)
                        pc.change_money(90000)
                        pc.give_item2(50011, 3)
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