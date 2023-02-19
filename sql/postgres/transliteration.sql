create or replace function iuliia_translate(str text, rules jsonb) returns text
    language plpgsql
    RETURNS NULL ON NULL INPUT
as
$$
DECLARE
    rec record;
    val text;
BEGIN
    -- https://dangry.ru/iuliia/
    -- https://github.com/nalgeon/iuliia
    -- https://habr.com/ru/post/499574/
    FOR rec IN SELECT * FROM jsonb_each_text(rules->'ending_mapping')
        LOOP
            str := regexp_replace(str, rec.key || '\M', rec.value);
            str := regexp_replace(str, initcap(rec.key) || '\M', initcap(rec.value));
        END LOOP;
    FOR rec IN SELECT * FROM jsonb_each_text(rules->'next_mapping')
        LOOP
            val := rec.value || rec.key;
            str := replace(str, rec.key, val);
            str := replace(str, initcap(rec.key), initcap(val));
        END LOOP;
    FOR rec IN SELECT * FROM jsonb_each_text(rules->'prev_mapping')
        LOOP
            if length(rec.key) = 1 then
                str := regexp_replace(str, '\m' || rec.key, rec.value);
                str := regexp_replace(str, '\m' || initcap(rec.key), initcap(rec.value));
            else
                val := substr(rec.key, 1, 1) || rec.value;
                str := replace(str, rec.key, val);
                str := replace(str, initcap(rec.key), initcap(val));
            end if;
        END LOOP;
    FOR rec IN SELECT * FROM jsonb_each_text(rules->'mapping')
        LOOP
            str := replace(str, rec.key, rec.value);
            str := replace(str, initcap(rec.key), initcap(rec.value));
        END LOOP;

    RETURN str;
END
$$;

/*Схема транслитерации Московского метрополитена
*/
create or replace function iuliia_translate_mosmetro(str text) returns text
    immutable
    strict
    language sql
    PARALLEL SAFE -- Postgres 10 or later
as
$$
select iuliia_translate(
               str,
           -- https://github.com/nalgeon/iuliia/blob/master/mosmetro.json
               '{
                 "name": "mosmetro",
                 "description": "Moscow Metro map transliteration schema",
                 "url": "https://dangry.ru/iuliia/mosmetro/",
                 "mapping": {
                   "а": "a",
                   "б": "b",
                   "в": "v",
                   "г": "g",
                   "д": "d",
                   "е": "e",
                   "ё": "e",
                   "ж": "zh",
                   "з": "z",
                   "и": "i",
                   "й": "y",
                   "к": "k",
                   "л": "l",
                   "м": "m",
                   "н": "n",
                   "о": "o",
                   "п": "p",
                   "р": "r",
                   "с": "s",
                   "т": "t",
                   "у": "u",
                   "ф": "f",
                   "х": "kh",
                   "ц": "ts",
                   "ч": "ch",
                   "ш": "sh",
                   "щ": "sch",
                   "ъ": "",
                   "ы": "y",
                   "ь": "",
                   "э": "e",
                   "ю": "yu",
                   "я": "ya"
                 },
                 "prev_mapping": {
                   "тц": "s",
                   "ьё": "o",
                   "ъё": "o"
                 },
                 "next_mapping": {
                   "ьа": "y",
                   "ье": "y",
                   "ьё": "y",
                   "ьи": "y",
                   "ьо": "y",
                   "ьу": "y",
                   "ьэ": "y",
                   "ъа": "y",
                   "ъе": "y",
                   "ъё": "y",
                   "ъи": "y",
                   "ъо": "y",
                   "ъу": "y",
                   "ъэ": "y"
                 },
                 "ending_mapping": {
                   "ий": "y",
                   "ый": "y"
                 },
                 "samples": [
                   [
                     "Юлия, съешь ещё этих мягких французских булок из Йошкар-Олы, да выпей алтайского чаю",
                     "Yuliya, syesh esche etikh myagkikh frantsuzskikh bulok iz Yoshkar-Oly, da vypey altayskogo chayu"
                   ],
                   ["Битцевский парк", "Bitsevsky park"],
                   ["Верхние Лихоборы", "Verkhnie Likhobory"],
                   ["Воробьёвы горы", "Vorobyovy gory"],
                   ["Выхино", "Vykhino"],
                   ["Зябликово", "Zyablikovo"],
                   ["Измайловская", "Izmaylovskaya"],
                   ["Кожуховская", "Kozhukhovskaya"],
                   ["Крылатское", "Krylatskoe"],
                   ["Марьина Роща", "Maryina Roscha"],
                   ["Марьино", "Maryino"],
                   ["Молодёжная", "Molodezhnaya"],
                   ["Октябрьская", "Oktyabrskaya"],
                   ["Ольховая", "Olkhovaya"],
                   ["Парк Победы", "Park Pobedy"],
                   ["Площадь Ильича", "Ploschad Ilyicha"],
                   ["Площадь Революции", "Ploschad Revolyutsii"],
                   ["Пятницкое шоссе", "Pyatnitskoe shosse"],
                   ["Румянцево", "Rumyantsevo"],
                   ["Саларьево", "Salaryevo"],
                   ["Семёновская", "Semenovskaya"],
                   ["Сходненская", "Skhodnenskaya"],
                   ["Текстильщики", "Tekstilschiki"],
                   ["Тёплый стан", "Teply stan"],
                   ["Третьяковская", "Tretyakovskaya"],
                   ["Тропарёво", "Troparevo"],
                   ["Фонвизинская", "Fonvizinskaya"],
                   ["Чистые пруды", "Chistye prudy"],
                   ["Шоссе Энтузиастов", "Shosse Entuziastov"],
                   ["Щёлковская", "Schelkovskaya"],
                   ["Электрозаводская", "Elektrozavodskaya"],
                   ["Юго-Западная", "Yugo-Zapadnaya"]
                 ]
               }'::jsonb
           );
$$;

comment on function iuliia_translate_mosmetro(str text)
    is 'Транслитерация текста с правилами транслитерации Мосметро, см. github.com/nalgeon/iuliia/blob/master/mosmetro.json';