
i=0

while test $i -ne 5

do

clear

echo 'Меню'

echo '1.Информация'

echo '2.Значение функции'

echo '3.Удаление содержимого заданной папки, с перемещением всех удаленных объектов в папку tmp'

echo '4.Проверить существования указанного в параметре файла и выдать сообщение о результате'

echo '5.Выход'

echo 'Выберите пункт меню'

read i

if test $i -eq 1

then echo 'Автор'

echo 'Лисицин Никита'

echo 'группа ИТП-11'

echo

echo 'О работе'

echo 'Этот сценарий результат лабораторной работы 4'

elif test $i -eq 2

then

echo 'Посчитаем значение функции x=(№Компьютера + №По журналу)*Возраст'

echo 'Для этого необходимо ввести данные'

echo 'Введите № компьютера'

read nk

echo 'Введите № по журналу'

read nv

echo 'Введите Ваш возраст'

read v

echo 'Значение функции равно'

x=`expr $nk \* $v + $nv \* $v`

echo x=$x

elif test $i -eq 3

then

echo 'Введите адрес папки'

read fold

if [ -d $fold ]

then

m= 0

cd $fold

for l in *

do

echo "$l"

cp $l /tmp

rm $l

m=`expr $m + 1 `

done

echo "Число скопированных файлов: $m"

else echo 'Такой папки не существует'

fi

elif test $i -eq 4

then

if [ -f $1 ]

then echo 'Файл существует'

else echo 'Файл не существует'

fi

elif test $i -eq 5

then echo 'Завершение работы'

fi

read key

done

Результат выполнения работы: