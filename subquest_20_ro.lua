---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_20  begin
           state start begin
                when login or levelup with pc.level >= 30  and pc.level <= 32  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Ah-Yu")
                        end
                end


                when __TARGET__.target.click or
                        20003.chat."Solutia sotului"  begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Ah-Yu:")
                        say_verde("")
                        say_verde("Sotul meu nu se descurca cu munca!")
                        say_verde("")
                        say_verde("Are nevoie de trei solutia sotului,")
                        say_verde("poti sa faci tu rost pentru el?")
                        say_item_vnum(30161)
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Ah-Yu:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ah-Yu:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ah-Yu:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ah-Yu:")
                        say_verde("")
                        say_verde("Du-te si omoara vantul negru.")
                        set_state(for_husband_product)
                end
    end
    state for_husband_product begin
                when letter begin
                        send_letter("~Lv 30 - Solutia sotului")
                        q.set_icon("scroll_open_golden.tga")
                        if pc.count_item(30161) >= 3 then
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Du-te la Ah-Yu")
                                end
                        end
                end

                when button or info begin
                        if pc.count_item(30161) >= 3 then
                                say_title("Solutia sotului")
                                say_verde("")
                                say_verde("Ai obtinut toate cele 3 solutii ale")
                                say_verde("sotului, acum intoarce-te la Ah-Yu.")
                                return
                        end
                        say_title("Solutia sotului")
                        say_verde("")
                        say_verde("Omoara vantul negru si obtine trei")
                        say_verde("solutia sotului pentru Ah-Yu.")

                end

                when 501.kill or 502.kill or  503.kill or 504.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30161")<3  then
                                pc.give_item2("30161", 1)
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Du-te la Ah-Yu")
                                end
                        end
                end

                when 20003.chat."Solutia sotului" with pc.count_item(30161)==0 begin
                        say_title("Ah-Yu:")
                        say_verde("")
                        say_verde("Are nevoie de trei solutia sotului,")
                        say_verde("poti sa faci tu rost pentru el?")
                        say_item_vnum(30161)
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Ah-Yu:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ah-Yu:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ah-Yu:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ah-Yu:")
                        say_verde("")
                        say_verde("Du-te si omoara vantul negru.")
                end
                when __TARGET__.target.click or
                        20003.chat."Solutia sotului" with pc.count_item(30161)>0 begin
                        target.delete("__TARGET__")
                        if pc.count_item(30161)<3 then
                                say_title("Ah-yu:")
                                say_verde("")
                                say_verde("Minunat, ai obtinut cateva dintre")
                                say_verde("solutia sotului, dar am nevoie de")
                                say_verde("trei. Mergi sa le cauti pe toate?")
                                local z=select("Ma duc sa mai caut","Nu am timp")
                                if 2==z then
                                        say_title("Ah-Yu:")
				                        say_verde("")
                                        say_verde("Atunci nu mai avem ce discuta!")
                                        set_state(__GIVEUP__)
                                        return
                                end

                        else
                                say_title("Ah-yu:")
                                say_verde("")
                                say_verde("Oh, le-ai obtinut pe toate? Grozav!")
                                say_verde("Iti multumesc ca m-ai ajutat.")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("900.000 Puncte de experienta")
                                say_reward("100.000 Yang")
                                say_reward("x20 Mantia curajului")
                                pc.give_exp2(900000)
                                pc.change_money(100000)
                                pc.give_item2(70038, 20)
                                pc.remove_item(30161, 3)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)
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