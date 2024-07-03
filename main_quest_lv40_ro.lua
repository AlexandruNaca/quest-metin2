---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv40 begin
        state start begin
        end
        state run begin
                when login or levelup or enter with pc.get_level() >= 40 begin
                        set_state( information )
                end
        end
        state information begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a patra" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when button or info begin
                    say_title("Pagina a patra")
                    say_verde("")
                    say_verde("Ai gasit deja trei Paginii ale jurnalului.")
                    say_verde("Pentru pagina a patra trebuie sa mergi in")
                    say_verde("Templu si sa omori Fanatic Mandru Intunecat.")
                end

                when 731.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30150)==0 then
                                pc.give_item2(30150, 1)
                                set_state(gototeacher)
                        end
                end
        end

        state gototeacher begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a patra" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin

                        say_title("Pagina a patra")
                        say_verde("")
                        say_verde("Ai gaist pagina a patra! Du-te la Uriel.")
                end
                when __TARGET__.target.click or 20011.chat."Pagina a patra" begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ah, pagina a patra? Perfect, tocmai ce am")
                        say_verde("terminat de descifrat celelalte paginii.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Multumesc pentru ajutor, o sa ma pun sa")
                        say_verde("descifrez si aceasta pagina imediat.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("5.000.000 Puncte de experienta")
                        say_reward("500.000 Yang")
                        say_reward("x20 Mantia curajului")
                        say_reward("x5 Binecuvantarea dragon")
                        say_reward("x1 Inelul experientei ( 30 Minute )")
                        pc.give_exp2(5000000)
                        pc.change_money(500000)
                        pc.give_item2(72002)
                        pc.give_item2(71020,5)
                        pc.give_item2(70038,20)
                        pc.remove_item(30150)
                        set_state( godoc4 )

                end
        end

        state godoc4 begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a cincea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20360)
                        if 0==v then
                        else
                                target.vid("__TARGET1__", v, "Cauta Monumentul Wha")
                        end

                        local v=find_npc_by_vnum(20361)
                        if 0==v then
                        else
                                target.vid("__TARGET2__", v, "Cauta Monumentul Wha")
                        end
                end

                when button or info begin
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Pagina a cincea")
                        say_verde("")
                        say_verde("Uriel crede ca pagina a cincea se afla")
                        say_verde("in desert in temnita maimutelor normale.")
                        say_verde("")
                        say_reward("Pagina a cincea este langa Monumentul Wha.")
                end
                when __TARGET1__.target.click or 20360.chat."Pagina a cincea" begin
                        target.delete("__TARGET1__")
                        say_pc_name()
                        say_verde("")
                        say_verde("Acesta este, Monumentul Wha.")
                        pc.setqf("click1",1)

                        if pc.getqf("click2") == 1 then
                                pc.setqf("click1",0)
                                pc.setqf("click2",0)

                                pc.give_item2(30150)
                                set_state( gototeacher2)
                                return
                        end
                        say_verde("Ar trebui sa caut mai adanc in temnita.")
                        say_verde("Trebuie sa mai fie un monument pe aici.")
                end

                when __TARGET2__.target.click or 20361.chat."The Su Memorial" begin
                        target.delete("__TARGET2__")
                        say_pc_name()
                        say_verde("")
                        say_verde("Acesta este, Monumentul Su.")
                        pc.setqf("click2",1);

                        if pc.getqf("click1") == 1 then
                                pc.setqf("click1",0)
                                pc.setqf("click2",0)
                                pc.give_item2(30150)
                                set_state( gototeacher2)
                                return
                        end
                        say_verde("Ar trebui sa ma intorc, cred ca am trecut")
                        say_verde("pe langa un monument important din temnita.")
                end
        end

        state gototeacher2 begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a cincea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a cincea")
                        say_verde("")
                        say_verde("Ai gasit pagina a cincea, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a cincea" begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Pagina a cincea? Chiar ma gandeam daca")
                        say_verde("o sa te mai intorci din temnita cu viata.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Multumesc pentru pagina, am sa o descifrez.")
                        say_verde("")
                        say_reward("5.000.000 Puncte de experienta")
                        say_reward("500.000 Yang")
                        say_reward("x20 Mantia curajului")
                        say_reward("x5 Binecuvantarea dragon")
                        pc.give_exp2(5000000)
                        pc.change_money(500000)
                        pc.give_item2(70038,20)
                        pc.give_item2(71020,5)
                        pc.remove_item(30150)

                        set_state( goboss )

                end
        end

        state goboss begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a sasea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Capitan")
                        end
                end
                when button or info begin
                        say_title("Pagina a sasea")
                        say_verde("")
                        say_verde("Du-te la Capitan si vezi ce informatii are")
                        say_verde("despre a sasea pagina din jurnalul secret.")
                end
                when __TARGET__.target.click or
                        20355.chat."Pagina a sasea" begin
                        target.delete("__TARGET__")
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Pagina a sasea? Eu nu stiu nimic de aceasta")
                        say_verde("pagina unde ar putea fi, incearca sa vorbesti")
                        say_verde("cu Nakajima, poate stie el ceva.")
                        set_state(survey)
                end
        end


        state survey begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a sasea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20364)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Nakajima")
                        end
                end
                when button or info begin
                        say_title("Pagina a sasea")
                        say_verde("")
                        say_verde("Capitanul nu are nici o informatie despre a")
                        say_verde("sasea pagina din jurnal, insa te-a trimis la")
                        say_verde("Nakajima, crede ca el stie ceva.")
                end
                when __TARGET__.target.click or
                        20364.chat."Pagina a sasea" begin
                        target.delete("__TARGET__")
                        say_title("Nakajima:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Paigna a sasea? Am auzit ca aceasta pagina")
                        say_verde("o are Capitanul Bestie insa se obtine foarte")
                        say_verde("greu de la el, dute si omoara cativa.")
                        set_state(survey2)
                end
        end

        state survey2 begin
                when letter begin
                        send_letter( "+Lv 40 - Pagina a sasea" )
                        q.set_icon("scroll_open_purple.tga")
                end

                when button or info begin
                        say_title("Pagina a sasea")
                        say_verde("")
                        say_verde("Nakajima a spus ca pagina a sasea se poate")
                        say_verde("gasi la Capitanul Bestie, insa foarte greu.")
                end
                when 591.kill begin
                        local s = number(1, 25)
                        if s < 3 and pc.count_item(30150)==0 then
                                pc.give_item2(30150, 1)
                                set_state(_end_)
                        else
                        	syschat("Anunt: Nu am gaist pagina a sasea la acest capitan bestie.")
                        end
                end
        end

        state _end_ begin

                when letter begin
                        send_letter( "+Lv 40 - Pagina a sasea" )
                        q.set_icon("scroll_open_purple.tga")
                end

                when button or info begin
                        say_title("Pagina a sasea")
                        say_verde("")
                        say_verde("Ai gasit pagina a sasea, insa Uriel nu a")
                        say_verde("terminat descifrarea celorlalte pagini.")
                        wait()
                        say_title("Pagina a sasea")
                        say_verde("")
                        say_reward("Tine pagina a sasea la tine pana ce ajungi")
                        say_reward("la nivelul 47, ai mare grija de pagina.")
                        clear_letter()
                        set_state(__COMPLETE__)
                        set_quest_state("main_quest_lv47", "run")
                end

        end
        state __COMPLETE__ begin
        end
end