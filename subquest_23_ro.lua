---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_23 begin
    state start begin
                when login or levelup with pc.level >= 36  and pc.level <= 38 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v= find_npc_by_vnum(20006)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Fratele lui Mirine")
                        end
                end

                when __TARGET__.target.click or
                        20006.chat."Fratele lui Mirine"  begin
                        target.delete("__TARGET__")
                        say_title("Mirine:")
                        say_verde("")
                        say_verde("Nu stiu unde este fratele meu, nu l-am")
                        say_verde("vazut de mult, imi e frica sa nu fi")
                        say_verde("patit ceva, te uiti dupa el te rog?")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Mirine:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Mirine:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Mirine:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Mirine:")
                        say_verde("")
                        say_verde("Multumesc, du-te si vorbeste cu Yu-Hwan!")
                        set_state(to_yuhwan)

                end
        end
    state to_yuhwan begin
                when letter begin
                        send_letter("~Lv 36 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")

                        local v= find_npc_by_vnum(20017)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Du-te Yu-Hwan")
                        end

                end
                when button or info begin
                        say_title("Du-te la Yu-Hwan")
                        say_verde("")
                        say_verde("Mirine nu stie ce sa intamplat cu fratele")
                        say_verde("ei, crede ca a patit ceva, du-te in satul")
                        say_verde("vecin si vorbeste cu Yu-Hwan.")
                end


                when __TARGET__.target.click or
                        20017.chat."Fratele lui Mirine" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say_verde("")
                        say_verde("Ti-am mai spus, Yang-Shin stie mai multe")
                        say_verde("despre fratele lui mirine, du-te la el.")
                        set_state(to_hunter)
                end
        end


        state to_hunter begin
                when letter begin
                        send_letter("~Lv 36 - Du-te la Yang-Shin")
                        q.set_icon("scroll_open_golden.tga")

                        local v= find_npc_by_vnum(20019)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Du-te la Yang-Shin")
                        end

                end
                when button or info begin
                        say_title("Du-te la Yang-Shin")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Yang-Shin.")
                end


                when __TARGET__.target.click or
                        20019.chat."Fratele lui Mirine" begin
                        target.delete("__TARGET__")
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("A gasit ginseng cand a plecat in munti,")
                        say_verde("dar a zis ca merge sa mai incerce si in")
                        say_verde("Valea Seonryoung, poate e pe acolo.")
                        wait()
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("Este un drum plin de pericol, esti sigur")
                        say_verde("ca vrei sa mergi acolo de unul singur?")
                        local s=select("Sigur, ma duc","Nu, mi-e frica")
                        if 2==s then
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yang-Shin:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("Indreaptate catre Valea Seonryoung.")
                        set_state(to_danger_place)
                end
        end

         state to_danger_place begin
                when letter begin
                        send_letter("~Lv 36 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")

                        local v= find_npc_by_vnum(20356)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Valea Seonryoung")
                        end

                end
                when button or info begin
                        say_title("Fratele lui Mirine")
                        say_verde("")
                        say_verde("Du-te in Valea Seonryoung si cauta-l pe")
                        say_verde("fratele lui Mirine, vezi daca e teafar.")
                end


                when __TARGET__.target.click or
                        20356.chat."Fratele lui Mirine?" begin
                        target.delete("__TARGET__")
                        say_pc_name()
                        say_verde("")
                        say_verde("Oh nu! Acesta e fratele lui Mirine!")
                        pc.give_item2(30155)
                        set_state(to_mirinae)
                end
        end



         state to_mirinae  begin
                when letter begin
                        send_letter("~Lv 36 - Fratele lui Mirine")
                        q.set_icon("scroll_open_golden.tga")

                        local v= find_npc_by_vnum(20006)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Du-te la Mirine")
                        end

                end
                when button or info begin
                        say_title("Fratele lui Mirine")
                        say_verde("")
                        say_verde("Tragic! Ai gasit corpul fratelui lui")
                        say_verde("Mirine, ai face bine sa mergi sa o")
                        say_verde("anunti, dar fi bland cu ea.")
                end


                when __TARGET__.target.click or
                        20006.chat."Fratele lui Mirine" with pc.count_item(30155)>0 begin
                        target.delete("__TARGET__")
                        say_title("Mirine:")
                        say_verde("")
                        say_verde("Ce? E mort? Oh nu! Nuuuuu! Ce o sa ma")
                        say_verde("fac fara el. Nu se poate... *plange*")
                        wait()
                        say_title("Mirine:")
                        say_verde("")
                        say_verde("Lasa-ma razboinicule, te rog lasa-ma")
                        say_verde("acum sa il jelesc pe fratele meu.")
                        wait()
                        say_title("Mirine:")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("3.000.000 Puncte de experienta")
                        say_reward("160.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(3000000)
                        pc.change_money(160000)
                        pc.give_item2(50011, 4)
                        pc.remove_item(30155,1)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__  begin
                when enter begin
                        q.done()
                end
        end
end