---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv30 begin
        state start begin
        end
        state run begin
                when login or levelup or enter with pc.get_level() >= 30 begin
                        set_state( gotoeUriel )
                end
        end
        state gotoeUriel begin
                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Cauta-l pe Uriel")
                        end
                end
                when letter begin
                        send_letter( "+Lv 30 - Secretul pietrelor metin" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when info or  button begin
                        say_title("Secretul pietrelor metin")
                        say_verde("")
                        say_verde("Cauta-l pe uriel, a descoperit ceva important.")
                end
                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Am descoperit un jurnal unde putem afla multe")
                        say_verde("lucruri despre misterioasele pietre metin.")
                        wait()
            			say_title("Uriel:")
            			say_verde("")
                        say_verde("Ajuta-ma sa culeg aceste pagini de jurnal care")
                        say_verde("sunt pierdute in diferite locatii si am sa te")
                        say_verde("rasplatesc pe masura.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_reward("Prima pagina se afla in temnita maimutelor")
                        say_reward("usor, in capat este un momnument magic.")
                        setstate( clickstone )
                        q.done()
                end
        end
        state clickstone begin
                when letter begin
                        local v=find_npc_by_vnum(20352)
                        if 0==v then
                        else
                                target.vid("__TARGET1__", v, "Temnita maimutelor usor")
                        end
                end
                when letter begin
                        send_letter( "+Lv 30 - Secretul pietrelor metin" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when info or  button begin
                        say_title("Secretul pietrelor metin")
                        say_verde("")
                        say_verde("Cauta monumentul magic din temnita maimutelor")
                        say_verde("usor, poti ajunge acolo prin satul vecin.")
                end
                when __TARGET1__.target.click begin
                        target.delete("__TARGET1__")
                        say_title("Secretul pietrelor metin")
                        say_verde("")
                        say_verde("Ai gaist prima pagina din jurnal, acum")
                        say_verde("intoarce-te inapoi la Uriel.")
                        pc.give_item2(30150)
                        setstate(gotoeUriel2)
                end
        end
        state gotoeUriel2 begin
                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Cauta-l pe Uriel")
                        end
                end
                when letter begin
                        send_letter( "+Lv 30 - Secretul pietrelor metin" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when info or button begin
                        say_title("Secretul pietrelor metin")
                        say_verde("")
                        say_verde("Ai gaist prima pagina din jurnal, acum")
                        say_verde("intoarce-te inapoi la Uriel.")
                end
                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Oh, ai gasit pagina din jurnal, minunat.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("O nu. Nu inteleg ce scrie pe pagina...")
                        say_verde("Am o idee, sti monumentul de langa Templul")
                        say_verde("Intunecat ? Cred ca acolo putem descrifra")
                        say_verde("ceea ce scrie pa ceste pagini misterioase.")
                        say_verde("")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Dute langa Templul Intunecat, in Vale si")
                        say_verde("incearca sa descifrezi pagina la monument.")

                        set_state(clickplace)
                end
        end
        state clickplace begin
                when letter begin
                        local v=find_npc_by_vnum(20353)
                        if 0==v then
                        else
                                target.vid("__TARGET2__", v, "Monumentul din Valea Seonryoung")
                        end
                end
                when letter begin
                    send_letter( "+Lv 30 - Secretul pietrelor metin" )
                    q.set_icon("scroll_open_purple.tga")
                end

		when info or  button begin
			say_title("Secretul pietrelor metin")
            say_verde("")
            say_verde("Dute langa Templul Intunecat, in Vale si")
            say_verde("incearca sa descifrezi pagina la monument.")
		end

            when __TARGET2__.target.click begin
            target.delete("__TARGET2__")
			say_title("Secretul pietrelor metin")
			say_verde("")
            say_verde("Ai reusit sa descifrezi pagina, acum")
            say_verde("intoarce-te inapoi la Uriel.")
            setstate(gotoeUriel3)
            q.done()
                end
        end
        state gotoeUriel3 begin
                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Cauta-l pe Uriel")
                        end
                end
                when letter begin
                        send_letter( "+Lv 30 - Secretul pietrelor metin" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when info or button begin
                    say_title("Secretul pietrelor metin")
                    say_verde("")
                    say_verde("Ai reusit sa descifrezi pagina, acum")
                    say_verde("intoarce-te inapoi la Uriel.")
                    say_verde("")
                end
                when __TARGET__.target.click begin

                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Minunat! Aceste informatii o sa fie de mare")
                        say_verde("folos capitanului, de asemenea si tu ai avut")
                        say_verde("o contributie uroasa, multumesc enorm.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("2.000.000 Yang")
                        say_reward("500.000 Yang")
                        say_reward("x20 Mantia curajului")
                        say_reward("x5 Binecuvantarea dragon")
                        pc.give_exp2(2000000)
                        pc.change_money(500000)
                        pc.give_item2(70038,20)
                        pc.give_item2(71020,5)
                        pc.remove_item(30150)
                        clear_letter()
                        set_state(__COMPLETE__)
                        set_quest_state("main_quest_lv32","run")
                        q.done()
                end
        end
        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end