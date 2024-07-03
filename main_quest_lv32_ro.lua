---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv32 begin
        state start begin
        end
        state run begin
                when login or levelup or enter with pc.get_level() >= 32 begin
                        set_state( gototeacher )
                end
        end

        state gototeacher begin
                when letter begin
                        send_letter( "+Lv 32 - Jurnalul secret" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Jurnalul secret")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("")
                        say_verde("Uriel te cauta, du-te si vorbeste cu el.")
                end
                when __TARGET__.target.click or
                        20011.chat."Jurnalul secret" begin
                        target.delete("__TARGET__")

                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Data trecuta ai fost de mare ajutor in")
                        say_verde("investigarea paginilor din jurnal, acum")
                        say_verde("am nevoie de ajutorul tau din nou.")
                        say_verde("")
                           wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("De data aceasta sunt in cautarea paginii")
                        say_verde("a doua din jurnal. Trebuie sa il cauti pe")
                        say_verde("Negustorul Ambulant, el are mai multe detalii.")
                        set_state( gomerchant )

                end
        end

        state gomerchant begin
                when letter begin
                        send_letter( "+Lv 32 - Jurnalul secret" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20010)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Negustorul Ambulant")
                        end
                end
                when button or info begin
                        say_title("Jurnalul secret")
                        say_verde("")
                        say_verde("De data aceasta Uriel e in cautarea paginii")
                        say_verde("a doua din jurnal. Trebuie sa il cauti pe")
                        say_verde("Negustorul Ambulant, el are mai multe detalii.")
                end
                when __TARGET__.target.click or
                        20010.chat."Jurnalul secret" begin
                        target.delete("__TARGET__")
                        say_title("Negustor Ambulant:")
                        say_verde("")
                        say_verde("Jurnalul secret? Da, am cateva informatii despre")
                        say_verde("acest jurnal insa in schimbul acestor informatii")
                        say_verde("am nevoie de 30 de sabii de argint+0.")
                        set_state( gotorequest )

                end
        end
        state gotorequest begin
                when letter begin
                        send_letter( "+Lv 32 - Jurnalul secret" )
                        q.set_icon("scroll_open_purple.tga")

                                if pc.count_item(60)>=30 then
                                        local v=find_npc_by_vnum(20010)
                                        if 0==v then
                                        else
                                                target.vid("__TARGET__", v, "Du-te la Negustorul Ambulant")
                                        end
                                end

                end
                when button or info begin
                        ---                                                   l
                        if pc.count_item(60)>=30 then
                                say_title("Jurnalul secret")
                                say_verde("")
                                say_verde("Acum ai cele 30 de Sabii de argint+0.")
                                return
                        end
                        say_title("Jurnalul secret")
                        say_verde("")
                        say_verde("Negustor Ambulant are informatii despre a 2-a")
                        say_verde("pagina din jurnal, insa doreste 30 de sabii de.")
                        say_verde("argint+0 in schimbul acestor informatii.")
                end


                when __TARGET__.target.click or
                        20010.chat."Jurnalul secret"  begin
                        target.delete("__TARGET__")

                        if pc.count_item(60)>=20 then
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_title("Negustor Ambulant:")
                                say_verde("")
                                say_verde("Asa mai vii de acasa, multumesc pentru sabii.")
                                say_verde("Din informatiile mele, a doua pagina se afla")
                                say_verde("langa monumentul Weol, undeva in primul sat.")
                                pc.remove_item(60,30)
                                set_state( gotodoc )
                        else
                                say_title("Negustor Ambulant:")
                                say_verde("")
                                say_verde("Unde sunt cele 30 de sabii de argint+0 ?")
                        end
                end
        end

        state gotodoc begin
                when letter begin
                        send_letter( "+Lv 32 - Jurnalul secret" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20357)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Monumentul Weol")
                        end
                end

                when button or info begin
                        ---
                        say_title("Jurnalul secret")
                        say_verde("")
                        say_verde("Negustorul Ambulant a zis ca a doua pagina")
                        say_verde("se afla langa Monumentul Weol din primul sat.")
                end

                when __TARGET__.target.click or
                        20357.chat."Jurnalul secret" begin
                        target.delete("__TARGET__")
                        say_title("Monument piatra Weol")
                        say_verde("")
                        say_verde("Aici este. Am gasit pagina a doua din jurnal.")
                        pc.give_item2(30150)
                        set_state( gototeacher2 )

                end
        end

        state gototeacher2 begin
                when letter begin
                        send_letter( "+Lv 32 - Jurnalul secret" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20011)
                            if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Jurnalul secret")
                        say_verde("")
                        say_verde("Ai gasit pagina a doua, du-te la Uriel.")
                end
                when __TARGET__.target.click or
                        20011.chat."Jurnalul secret" begin
                        target.delete("__TARGET__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Incredibil, ai facut o treaba buna.")
                        say_verde("Am sa descifrez pagina mai tarziu.")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Multumesc pentru ajutorul tau.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("2.000.000 Puncte de experienta")
                        say_reward("500.000 Yang")
                        say_reward("x1 Inelul experientei ( 30 Minute )")
                        pc.give_item2(72002)
                        pc.give_exp2(2000000)
                        pc.change_money(500000)
                        pc.remove_item(30150)
                        set_state( gotohunter )

                end
        end

        state gotohunter begin
                when letter begin
                        send_letter( "+Lv 32 - Du-te la Yang-Shin" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20019)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Yanh-Shin")
                        end
                end
                when button or info begin
                        say_title("Du-te la Yang-Shin")
                        say_verde("")
                        say_verde("Yang-Shin vanatorul are informatii despre")
                        say_verde("Valea Seonryoung, du-te si vorbeste cu el.")
                end

                when __TARGET__.target.click or
                        20019.chat."Informatii despre Valea Seonryoung" begin
                        target.delete("__TARGET__")
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("Ce vrei sa aflii despre Valea Seonryoung?")
                        say_verde("Pai este un loc destul de periculos mai")
                        say_verde("ales pentru razboinicii nepregatiti.")
                        wait()
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("Ce? Cauti paginiile Jurnalului secret?")
                        say_verde("")
                        say_verde("O data am auzit ca a treia pagina din")
                        say_verde("Jurnalul secret se afla la Orcii Elite")
                        say_verde("Vrejitori, incearca sa omori cativa.")
                        set_state( godoc2 )

                end
        end

        state godoc2 begin
                when letter begin
                        send_letter( "+Lv 32 - Pagina a treia" )
                        q.set_icon("scroll_open_purple.tga")
                end
                when button or info begin
                        say_title("Pagina a treia")
                        say_verde("")
                        say_verde("Vanatorul Yanh-Shin a spus ca Pagina a")
            			say_verde("treia s-ar putea sa fie la Orcii Elite")
            			say_verde("Vrajitori, du-te in Vale si omoara cativa.")
                end
                when 634.kill begin
                        local s = number(1, 75)
                        if s <= 5 and pc.count_item("30150")==0 then
                                pc.give_item2(30150, 1)
                                set_state( goteacher3 )
                        end
                end
        end
        state goteacher3 begin
                when letter begin
                        send_letter( "+Lv 32 - Pagina a treia" )
                        q.set_icon("scroll_open_purple.tga")
                        local v=find_npc_by_vnum(20011)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Uriel")
                        end
                end
                when button or info begin
                        say_title("Pagina a treia")
                        say_verde("")
                        say_verde("Ai gasit Pagina a treia, du-te la Uriel.")
                end

                when __TARGET__.target.click or
                        20011.chat."Pagina a treia" begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ce? Ai si gasit Pagina a treia? Incredibil!")
                        say_verde("Cum ai reusit asa de repede? Esti chiar bun!")
                        say_verde("")
                        wait()
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("In sfarsit, acum am si a treia pagina, iti")
                        say_verde("multumesc. Abia astept sa citesc jurnalul.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("2.000.000 Puncte de experienta")
                        say_reward("500.000 Yang")
                        say_reward("x20 Mantia curajului")
                        say_reward("x5 Binecuvantarea dragon")
                        pc.give_exp2(2000000)
                        pc.change_money(500000)
                        pc.give_item2(71020,5)
                        pc.give_item2(70038,20)
                        pc.remove_item(30150)
                        set_state(godoc3)

                end
        end

        state godoc3 begin

                when letter begin
                        send_letter( "+Lv 32 - Pagina a patra" )
                        q.set_icon("scroll_open_purple.tga")
                end

                when button or info begin
                        say_title("Pagina a patra")
                        say_verde("")
                        say_verde("Ai gasit deja trei pagini ale jurnalului.")
                        say_verde("Uriel are nevoie de timp ca sa le descifreze.")
                        say_verde("")
                        say_reward("Pentru pagina a patra trebuie sa ajungi la")
                        say_reward("nivelul 40. Momentan, este prea periculos.")

                        clear_letter()
                        set_quest_state("main_quest_lv40", "run")
                        set_state(__COMPLETE__)

                end

        end
        state __COMPLETE__ begin
        end

end