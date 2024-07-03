---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv27 begin
        state start begin
        end
        state run begin
                when login or levelup or enter begin
                        if pc.get_level() >= 27 then
                                setstate( gotoboss )
                        end
                end
        end
        state gotoboss begin
                when letter begin
                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Cauta-l pe Capitan")
                        end
                end
                when letter begin
                        send_letter( "+Lv 27 - Distruge pietrele metin" )
                        q.set_icon("scroll_open_purple.tga")
                        q.start()
                end
                when button or info begin
                        say_title("Distruge pietrele metin")
                        say_verde("")
                        say_verde("Capitanul te cauta, du-te si vorbeste cu el.")

                end
                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Distruge Metinul Amarului, satenii se tem")
                        say_verde("de aceste metine care cad din cer.")
                        setstate( killmetinstone )
                        q.done()
                end
        end

        state killmetinstone begin
                when letter begin
                        send_letter( "+Lv 27 - Distruge pietrele metin" )
                        q.set_icon("scroll_open_purple.tga")
                        q.start()
                end
                when button or info begin
                        say_title("Distruge pietrele metin")
                        say_verde("")
                        say_verde("Capitanul a zis sa distrugi Metinul Amarului.")
                end
                when 8005.kill begin
                        say_title("Distruge pietrele metin")
                        say_verde("")
                        say_verde("Ai distrus Metinul Amarului, acum intoarce-te")
                        say_verde("la Capitan si raporteaza.")
                        setstate(gotoboss2)
                        q.done()
                end
        end
        state gotoboss2 begin
                when letter begin
                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Cauta-l pe Capitan")
                        end
                end
                when letter begin
                        send_letter( "+Lv 27 - Distruge pietrele metin" )
                        q.set_icon("scroll_open_purple.tga")
                        q.start()
                end
                when button or info begin
                        say_title("Distruge pietrele metin")
                        say_verde("")
                        say_verde("Ai distrus Metinul Amarului, acum intoarce-te")
                        say_verde("la Capitan si raporteaza.")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Ai facut o treaba buna, exact cum ma")
                        say_verde("asteptam din partea ta, incep sa ma")
                        say_verde("pot baza pe tine in orice problema.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("100.000 Yang")
                        say_reward("1.000.000 Puncte de experienta")
                        say_reward("x20 Mantia curajului")
                        pc.give_exp2( 1000000 )
                        pc.change_money( 100000 )
                        pc.give_item2(70038,20)
                        q.done()
                        clear_letter()
                        set_state(__COMPLETE__)
                        set_quest_state("main_quest_lv30","run")
                end
        end
        state __COMPLETE__ begin
        end
end