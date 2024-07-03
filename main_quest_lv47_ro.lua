---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv47 begin
        state start begin
        end
        state run begin
                when login or levelup with pc.get_level() >= 47 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a sasea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina sasea")
                        say_verde("")
                        say_verde("Dute la uriel cu pagina a sasea care ai")
                        say_verde("luat-o de la Capitanul Bestie.")
                end
                when __TARGET__.target.click or
                        20011.chat."Paigna a sasea" begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ai gasit pagina a sasea, perfect.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Multumesc, stiu ca a fost greu.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("10.000.000 Puncte de experienta")
                        say_reward("1.000.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        pc.give_exp2(10000000)
                        pc.change_money(1000000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.remove_item(30150)
                        set_state( survey )

                end
        end

        state survey begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20362)

                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Monumentul Nok")
                        end
                end
                when button or info begin
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Pagina a saptea")
                        say_verde("")
                        say_verde("Pagina a saptea se afla in Temnita Paiajenilor")
                        say_verde("langa Monumentul Nok, du-te acolo si verifica.")
                end
                when __TARGET__.target.click or
                        20362.chat."Paigna a saptea" begin
                        target.delete("__TARGET__")
                        say_title("Pagina a saptea")
                        say_verde("")
                        say_verde("Ai gasit pagina a saptea, du-te la Uriel.")
                        pc.give_item2(30150)
                        set_state( gototeacher2 )
                end
        end

        state gototeacher2 begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a saptea")
                        say_verde("")
                        say_verde("Ai gasit pagina a saptea, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a saptea" begin
                        target.delete("__TARGET__")
                        ---                                                   l
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ai gasit ceva in Temnita Paiajenilor?")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Pagina a saptea? Mai lipsesc doar cateva.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("10.000.000 Puncte de experienta")
                        say_reward("1.000.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        pc.give_exp2(10000000)
                        pc.change_money(1000000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.remove_item(30150)

                        set_state(gotomusician)

                end
        end

        state gotomusician begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")
                        local v=find_npc_by_vnum(20017)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Yu-Hwan")
                        end
                end

                when button or info begin
                        say_title("Pagina a saptea")
                        say_verde("")
                        say_verde("Du-te la Yu-Hwan, vezi ce are de spus")
                        say_verde("desprea pagina a saptea din jurnal.")
                end

                when __TARGET__.target.click or
                        20017.chat."Pagina a saptea" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say_verde("")
                        say_verde("Paigna a saptea? Da, stiu ca Beduinii din")
                        say_verde("desert au aceasta pagina, insa acestia sunt")
                        say_verde("foarte periculosi si puternici, ai mare grija.")
                        set_state(his_advice)
                end
        end

        state his_advice begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")
                end

                when button or info begin
                        say_title("Pagina a saptea")
                        say_verde("")
                        say_verde("Yu-Hwan a spus ca pagina a saptea ar putea")
                        say_verde("sa fie la Beduinii din Desertul Yongbi.")
                end

                when 2108.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30150")==0 then
                                pc.give_item2(30150, 1)
                                set_state(gotomusician1)
                        end
                end
        end


        state gotomusician1 begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")
                        local v=find_npc_by_vnum(20017)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Yu-Hwan")
                        end
                end

                when button or info begin
                        say_title("Paigna a saptea")
                        say_verde("")
                        say_verde("Ai gasit pagina a saptea, dute la Yu-Hwan.")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say_verde("")
                        say_verde("Da, aceasta este pagina de care ti-am spus,")
                        say_verde("este cea de care ai tu nevoie nu?")
                        say_verde("")
                        say_verde("Dute la Uriel cu ea, o sa fie incantat.")
                        q.done()
                        set_state(gototeacher)
                end
        end

        state gototeacher begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a saptea" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Paigna a saptea")
                        say_verde("")
                        say_verde("Dute la Uriel cu pagina a saptea.")
                end
                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        ---                                                   l
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Paigna a saptea? Astea sunt vesti bune.")
                        say_verde("Mai avem putin pana la finalul jurnalului.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ca de obicei, ai facut o treaba excelenta.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("10.000.000 Puncte de experienta")
                        say_reward("1.000.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        pc.give_exp2(10000000)
                        pc.change_money(1000000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.remove_item(30150)
                        set_state(survey2)

                end
        end

        state survey2 begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a opta" )
                        q.set_icon("scroll_open_purple.tga")

                end
                when button or info begin
                        say_title("Pagina a opta")
                        say_verde("")
                        say_verde("Pana acum ai gasit sapte pagini din jurnal.")
                        say_verde("")
                        say_verde("Ai facut o treaba excelenta, dar de acum")
                        say_verde("nu va mai fi asa de usor, omoara Sarpe")
                        say_verde("Spadasin si Sarpe Arcas pentru a obtine")
                        say_verde("a opta pagina din jurnalul secret.")
                end

                when 2106.kill or 2107.kill begin
                        local s = number(1, 200)
                        if s <= 5 and pc.count_item("30150")==0 then
                                pc.give_item2(30150, 1)
                                set_state( gototeacher3 )
                        end
                 end
        end


        state gototeacher3 begin
                when letter begin
                        send_letter( "+Lv 47 - Pagina a opta" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a opta")
                        say_verde("")
                        say_verde("Ai gasit pagina a opta, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Pagina a opta" begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Wow, ai gasit pagina a opta? Incredibil.")
                        say_verde("Ai devenit un razboinic puternic, bravo.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("10.000.000 Puncte de experienta")
                        say_reward("1.000.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x10 Binecuvantarea dragon")
                        pc.give_exp2(10000000)
                        pc.change_money(1000000)
                        pc.give_item2(70038,40)
                        pc.give_item2(71020,10)
                        pc.remove_item(30150)
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Oh, era sa uit, nu am apucat sa descifrez")
                        say_verde("ultimele pagini pe care mi le-ai adus si o")
                        say_verde("sa am nevoie de putin timp sa ma ocup de ele.")
                        say_verde("")
                        say_reward("Pentru pagina a noua ai nevoie de nivel 50.")

                        clear_letter()
                        set_state(__COMPLETE__)
                        set_quest_state("main_quest_lv50", "run")
                end
        end
        state __COMPLETE__ begin
        end
end