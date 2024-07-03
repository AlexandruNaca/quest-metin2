---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_27 begin
        state start begin
                when login or levelup with pc.level >= 38  and pc.level <= 40  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Soon")
                        end
                end

                when __TARGET__.target.click or
                 20023.chat."Cum merge treaba" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Hm, ce vrei acum? Nu vezi ca citesc?" )
                        say_verde("Ti-am spus sa nu ma deranjezi cand")
                        say_verde("citesc! De ce nu ma asculti! Of,of.")
                        set_state(to_wife)

                end
        end
        state to_wife begin
                when letter begin
                        local v=find_npc_by_vnum(20002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Aranyo")
                        end

                        send_letter("~Lv 38 - Du-te la Aranyo")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                end

                when info or button begin

                        say_title("Du-te la Aranyo")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Aranyo.")


                end

                when __TARGET__.target.click or
                        20002.chat."Ce e cu Soon?" begin
                        target.delete("__TARGET__")
                        say_title("Aranyo:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("De unde sa stiu eu ce se intampla cu")
                        say_verde("el, nu l-am mai vazut de zile intregi.")
                        say_verde("")
                        say_verde("Du-te si intreaba-o pe negustoare!")
                        set_state(to_neighbor)
                end
        end

        state to_neighbor  begin
                when letter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Magazin general")
                        end

                        send_letter("~Lv 38 - Du-te la negustoare")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                end

                when info or button begin

                        say_title("Du-te la negustoare")
                        say_verde("")
                        say_verde("Du-te le negustoare si intreab-o pe ea.")

                end


                when __TARGET__target.click or
                        9003.chat."Ce e cu Soon?"  begin
                        target.delete("__TARGET__")
                        say_title("Magazinul general:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ieri a venit la mine fara nici un yang ca")
                        say_verde("sa cumpere o carte secreta din vale.")
                        say_verde("")
                        say_verde("Poate asta este problema lui, cine stie.")
                        set_state(back_to_soon)
                end

        end

        state back_to_soon begin

                when letter begin

                        send_letter("~Lv 38 - Du-te la Soon")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v = find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Soon")
                        end

                end

                when info or button begin

                        say_title("Du-te la Soon")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Soon despre carte.")


                end

                when __TARGET__.target.click or
                        20023.chat."Ce e cu tine?" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Am citit toate cartile din lume dar")
                        say_verde("am auzit ca mai exista inca o carte!")
                        say_verde("Cartea secreta din Vale! Poti sa imi")
                        say_verde("faci tu rost de aceasta carte? Vreau")
                        say_verde("neaparat sa o citesc, e pasiunea mea.")

  
                        local s=select("Sigur, ma duc","Nu, n-am timp")
                        if 2==s then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Du-te in Valea Seonryoung si omoara")
                                say_verde("fanatici inalti pana obtii cartea!")
                                set_state(find_book)

                end

        end


        state find_book begin

                when letter begin

                        if pc.count_item(30156)>=1 then
                            send_letter("~Lv 38 - Ai obtinut cartea")
                            q.set_icon("scroll_open_golden.tga")
                                q.start()

                                local v=find_npc_by_vnum(20023)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Du-te la Soon")
                                end
                                return
                        end

                        send_letter("~Lv 38 - Cartea secreta")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                end

                when info or  button begin
                        if pc.count_item("30156")>=1 then
                                say_title("Ai obtinut cartea")
                                say_verde("")
                                say_verde("Ai obtinut cartea, du-te la Soon.")
                                return
                        end

                        say_title("Cartea secreta")
                        say_verde("")
                        say_verde("Du-te in Valea Seonryoung si omoara")
                        say_verde("Fanatic Intunecat pana obtii cartea.")
                end

                when 701.kill  begin

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30156)==0  then
                                pc.give_item2(30156, 1)

                        end
                end


                when __TARGET__.target.click or
                        20023.chat."Am obtinut cartea"   begin
                        target.delete("__TARGET__")
                        if pc.count_item(30156)>=1 then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Oh! In sfarsit! Cartea secreta din Vale!")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("3.000.000 Puncte de experienta")
                                say_reward("190.000 Yang")
                                say_reward("x4 Cufar lumina lunii")
                                pc.give_exp2(3000000)
                                pc.change_money(190000)
                                pc.give_item2(50011, 4)
                                pc.remove_item(30156,1)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)




                                return
                        else
                                say_title("Soon:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Nu ai cartea? Vrei sa mergi sa mai")
                                say_verde("incerci sa bati fanatici intunecati?")
          
                                local s=select("Sigur, ma duc","Nu, n-am timp")
                                if 2==s then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Vrei sa abandonezi misiunea?")
                                        say_verde("")
                                        local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                say_title("Soon:")
                                                say_verde("")
                                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                                return
                                        end
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Atunci nu mai avem ce discuta!")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Du-te in Valea Seonryoung si omoara")
                                        say_verde("fanatici inalti pana obtii cartea!")

                                end


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