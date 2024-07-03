---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv50 begin
        state start begin
        end
        state run begin
                when login or levelup or enter with pc.get_level()>= 50 begin
                        set_state( information )
                end
        end
        state information begin
                when letter begin
                    send_letter( "+Lv 50 - Pagina a noua" )
                    q.set_icon("scroll_open_purple.tga")
                end
                when button or info begin
                        say_title("Pagina a noua")
                        say_verde("")
                        say_verde("Pagina a noua se afla in undeva in temnita")
                        say_verde("paianjenilor la Paianjen Soldat Mandru.")
                end
                when 2036.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30150")==0 then
                                pc.give_item2(30150, 1)
                                set_state( gototeacher5)
                        end
                end
        end
        state gototeacher5 begin
                when letter begin
                    send_letter( "+Lv 50 - Pagina a noua" )
                    q.set_icon("scroll_open_purple.tga")
                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a noua")
                        say_verde("")
                        say_verde("Ai gasit pagina a noua, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a noua" begin
                        target.delete("__TARGET__")
                        ---                                                   l
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ai gasit pagina a noua? Bravo, te asteptam!")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Mai lipsesc inca 4 pagini din jurnalul secret.")
                        say_verde("Fara tine, nu cred ca puteam sa reusesc.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("15.000.000 Puncte de experienta")
                        say_reward("1.500.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        say_reward("x5 Cufar mistic")
                        pc.give_exp2(15000000)
                        pc.change_money(1500000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.give_item2(50217,5)

                        pc.remove_item(30150)

                        set_state( survey6)

                end
        end
        --10te
        state survey6 begin
                when letter begin
                    send_letter( "+Lv 50 - Pagina a 10-a" )
                    q.set_icon("scroll_open_purple.tga")
                        local v=find_npc_by_vnum(20359)
                        if 0==v then
                        else
                                target.vid("__TARGET1__", v, "Cauta Cutie cu manuscrise")
                        end

                end
                when button or info begin
                        say_title("Pagina a 10-a")
                        say_verde("")
                        say_verde("Candva a avut loc un razboi teribil pe")
                        say_verde("Muntele Sohan, vezi daca poti gasi ceva")
                        say_verde("in ramasitele razboilui de pe munte.")
                        say_verde("")
                        say_verde("Ar trebui sa fie o Cutie cu manuscrise.")
                end

                when __TARGET1__.target.click or
                        20359.chat."Pagina a 10-a" begin
                        say_verde("")
                        say_verde("Ah, asta este! Am gasit a 10-a pagina!")
                        pc.give_item2(30150)
                        set_state( gototeacher6)
                end
        end

        state gototeacher6 begin
                when letter begin
                        send_letter( "+Lv 50 - Pagina a 10-a" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a 10-a")
                        say_verde("")
                        say_verde("Ai gasit pagina a 10-a, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a 10-a" begin
                        target.delete("__TARGET__")
                        ---                                                   l
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Te asteptam, bun, ai pagina a 10-a, esti")
                        say_verde("formidabil, mereu duci la bun sfarsit orice")
                        say_verde("sarcina. O sa devii un luptator puternic.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Mai lipsesc inca 3 pagini din jurnalul secret.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("15.000.000 Puncte de experienta")
                        say_reward("1.500.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        say_reward("x5 Cufar mistic")
                        pc.give_exp2(15000000)
                        pc.change_money(1500000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.give_item2(50217,5)

                        pc.remove_item(30150)

                        set_state(survey7)

                end
        end

        state survey7 begin
                when letter begin
                    send_letter( "+Lv 50 - Pagina a 11-a" )
                    q.set_icon("scroll_open_purple.tga")

                end
                when button or info begin
                        say_title("Pagina a 11-a")
                        say_verde("")
                        say_verde("Pagina a 11-a se afla in undeva in temnita")
                        say_verde("paianjenilor la Paianjen Gheara Toxica.")
                end

                when 2034.kill begin
                        pc.give_item2(30150)
                        set_state( gototeacher7)
                end
        end

        state gototeacher7 begin
                when letter begin
                    send_letter( "+Lv 50 - Pagina a 11-a" )
                    q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a 11-a")
                        say_verde("")
                        say_verde("Ai gasit pagina a 11-a, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a 11-a" begin
                        target.delete("__TARGET__")
                        ---                                                   l
                         say_title("Uriel:")
                        say_verde("")
                        say_verde("Pagina a 11-a, asa de repede? Ma lasi fara")
                        say_verde("cuvinte. In curand o sa putem pune cap in")
                        say_verde("cap toate paginile si v-om afla secretul.")
                        say_verde("pietrelor metin. Datorita tie bineinteles.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Mai lipsesc inca 2 pagini din jurnalul secret.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("15.000.000 Puncte de experienta")
                        say_reward("1.500.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        say_reward("x5 Cufar mistic")
                        pc.give_exp2(15000000)
                        pc.change_money(1500000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.give_item2(50217,5)

                        pc.remove_item(30150)

                        clear_letter()
                        set_state(__COMPLETE__)
                        set_quest_state("main_quest_lv55", "run")
                end
        end
        state __COMPLETE__ begin
        end
end