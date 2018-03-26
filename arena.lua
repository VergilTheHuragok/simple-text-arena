health = 20 --1
enemyhealth = 20 --2
attack = 1--3
money = 0
cost = 0--5
enemyattack= 1
price = money-cost--7
level = 1
attacklevel=1
xp= 0
xpneeded=10
weapon= "fists"
repeat--8
   print("Your Health="..health)--9
   print("The enemies health="..enemyhealth)
   print("Your weapon="..weapon)
   print("Your Attack="..attack)--11
   print("The enemy's attack="..enemyattack)
   print("Your Money="..money)
   print("Your xp="..xp)
   print("Xp needed="..xpneeded)
   print("Your level="..level)
   if health<=enemyattack then
      print("Warning!")
   end
   injury= enemyhealth-attack--13
   print("attack?")--14
   move = io.read()--15
   if move == "y" then--16
      enemyhealth= enemyhealth - attack
      enemymove= math.random(2)--19
      if enemymove == 1 then--20
         health= health-enemyattack
      elseif enemymove== 2 then
         enemyhealth = enemyhealth+enemyattack
      end
      enemyattack =enemyattack +level/4
      xp= xp + enemyattack
      if xp >=xpneeded then
         level = level + 1
         print("You have leveled up!")
         print("Do you want to level up in attack, health,")
         levelup=io.read()
         if levelup == "a" then
            print("You have lost your weapons but gained attack")
            weapon= "fists"
            attacklevel= attacklevel+level*3
            attack= attacklevel
            xp=0
            money= money+level
            xpneeded=xpneeded+enemyattack*enemyattack
         elseif levelup== "h" then
            health = health + level*10
            xp= 0
            money=money+level
            xpneeded=xpneeded+enemyattack*enemyattack
         end
      end
      money = money + level
   elseif move == "n" then--Store
      print("Do you want to use the store?")--23
      store = io.read()--24
      if store == "y" then--25
         print(" Do you want to buy a sword(10),knife(2),potion("..level.."),longsword(20),mace(15),Warhammer(50)")
         buy = io.read()--27
         if buy == "s" then--28
            if money>=10 then--29
               cost = 10--30
               money = money- cost
               attack= attacklevel+5
               weapon= "sword"
            elseif money<10 then--34
               print("Not enough money")--35
            end--36
         elseif buy == "k" then--37
            if money>=2 then
               money = money-2
               attack = attacklevel+3
               weapon= "knife"
            elseif money<2 then
               print("Not enough money!")
            end
         elseif buy == "p" then
            if money>= level then
               money = money -level
               health = health + math.random(level*5)
            elseif money< 1 then
               print("Not enough money")
            end
         elseif buy == "l" then
            if money>= 20 then
               money = money-20
               attack = attacklevel+ 10
            elseif money < 20 then
               weapon="longsword"
               print("Not enough money!")
            end
         elseif buy== "m" then
            if money>=15 then
               money=money-15
               attack=attacklevel+7
               weapon="mace"
            elseif money<15 then
               print("Not enough money!")
            end
         elseif buy == "w" then
            if money>=50 then
               money= money-50
               attack=attacklevel+30
               weapon="warhammer"
            elseif money < 50 then
               print("Not enough money!")
            end
         end--End of store
      elseif store == "n" then
         print("Quit?")
         quit = io.read()
         if quit == "y" then
            print("Draw!")
            break
         elseif quit == "n" then
         end
      end
   end
until enemyhealth <= 0 or
health<= 0
if health<= 0 then
   print("You have lost")
elseif enemyhealth<=0 then
   print("You have won!")
end