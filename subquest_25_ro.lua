---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_25 begin
        state start begin
                when login or levelup with pc.level >= 31  and pc.level <= 33 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20022)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Huahn-So")
                        end
                end

                when __TARGET__.target.click or
                 20022.chat."Flori pentru Ariyoung" begin
                        target.delete("__TARGET__")
                        say_title("Huahn-So:")
                        say_verde("")
                        say_verde("Sti... Eu simt ceva pentru Ariyoung, de")
                        say_verde("cand i-a murit sotul imi e foarte mila")
                        say_verde("de ea si as vrea sa o pot ajuta.")
                        say_verde("")
                        say_verde("Vreau sa incep relatia noastra cum se")
                        say_verde("cuvine, dar nu stiu ce ii place, du-te")
                        say_verde("si vorbeste cu ea, dar te rog fi discret.")
                        set_state(to_hear_about_her)

                end
        end

        state to_hear_about_her begin
                when letter begin
                        send_letter("~Lv 31 - Du-te la Ariyoung")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20021)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Ariyoung")
                        end

                end

                when info or button begin
                        say_title("Du-te la Ariyoung")
                        say_verde("")
			----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Huahn-So are o afectiune pentru Ariyoung,")
                        say_verde("du-te si intreab-o ce ii place.")
                end

                when  __TARGET__.target.click or
                        20021.chat."Ce iti place?" begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say_verde("")
                        say_verde("Pai, ca oricarei femei, imi plac cel")
                        say_verde("mai mult florile, le ador enorm.")
                        set_state(order)


                end
        end
        state order begin
                when letter begin
                        send_letter("~Lv 31 - Du-te la Huahn-So")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20022)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Huahn-So")
                        end

                end
                when info or button begin
                        say_title("Du-te la Huahn-So")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Huahn-So.")
                end

                when __TARGET__.target.click or
                        20022.chat."Am aflat ce ii place"  begin
                        target.delete("__TARGET__")

                        say_title("Huahn-So:")
                        say_verde("")
                        say_verde("Deci, ce ii place, spune-mi repede.")
                        wait()
                        say_title("Huahn-So:")
                        say_verde("")
                        say_verde("Aha, deci ii plac florile? Minunat, stiu")
                        say_verde("exact locul de unde sa le iau, doar ca nu")
                        say_verde("pot sa merg pana acolo, trebuie sa raman")
                        say_verde("sa o supraveghez pe Ariyoung, nu mergi tu?")
                        local s=select("Sigur, ma duc","Nu, n-am timp")
                        if 2==s then
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Huahn-So:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Du-te la marginea satului si adumi")
                                say_verde("acele flori frumoase galbene.")
                                set_state(find_flower)
                                pc.setqf("flower_done",0)
                        end


        end

        state find_flower begin
                when letter begin
                        send_letter("~Lv 31 - Flori galbene")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20358)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Flori galbene")
                        end


                end
                when info or  button begin
                        say_title("Flori galbene")
                        say_verde("")
                        say_verde("Du-te la marginea din primul sat si")
                        say_verde("culege cateva flori pentru Huahn-So.")

                end
                when 20022.chat. "Flori galbene" begin
                        say_title("David:")
                        say_verde("")
                        say_verde("Deci, mergi sa imi faci rost de flori?")
  
                        local s=select("Sigur, ma duc","Nu, n-am timp")
                        if 2==s then
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Huahn-So:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                                say_title("Huahn-So:")
                                say_verde("")
                                say_verde("Du-te la marginea satului si adumi")
                                say_verde("acele flori frumoase galbene.")



                end


                when __TARGET__.target.click or
                        20358.chat."Flori fara nume" with pc.getf("subquest_25","flower_done")==0 begin
                                target.delete("__TARGET__")
                                say_title("Flori fara nume")
                                say_verde("")
                                say_verde("Acestea sunt florile, sa le culeg.")
                                pc.give_item2(30153, 1)
                                pc.setqf("flower_done",1)
                                set_state(go_to_reward)
                        end

        end

        state go_to_reward begin
                when letter begin
                        send_letter("~Lv 31 - Am florile galbene")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20022)
                        if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Du-te la Huahn-So")
                        end

                end
                when info or  button begin
                        say_title("Am florile galbene")
                        say_verde("")
                        say_verde("Ai obtinut florile, du-te la Huahn-So.")

                end

                when __TARGET__.target.click or
                        20022.chat."Am florile galbene" with pc.count_item(30153) > 0 begin
                        target.delete("__TARGET__")
                        say_title("Huahn-So:")
                        say_verde("")
                        say_verde("Multumesc pentru ajutor, uraza-mi succes!")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("1.500.000 Puncte de experienta")
                        say_reward("110.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(1500000)
                        pc.change_money(110000)
                        pc.give_item2(50011, 4)
                        pc.remove_item(30153,1)
                        pc.setqf("state", 0)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)

                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
        end
end