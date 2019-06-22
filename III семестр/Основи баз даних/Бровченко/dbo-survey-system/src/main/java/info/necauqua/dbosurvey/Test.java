package info.necauqua.dbosurvey;

import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) throws InterruptedException {
        DBManager manager = new DBManager();

        Poll first = manager.getPoll(1);
        System.out.println(first.getQuestions().get(2).getText());
//        manager.addPoll(createGamePoll());
//        manager.addPoll(createCafePoll());

        Thread.sleep(3000); // wait for it before closing

        manager.close();
    }

    private static final QuestionType nOfMany = new QuestionType("N of Many");
    private static final QuestionType matrix = new QuestionType("Matrix");
    private static final QuestionType open = new QuestionType("Open");
    private static final QuestionType sort = new QuestionType("Sorted");

    private static Poll createGamePoll() {
        Poll poll = new Poll("Популярність ігор", "bla-bla-bla, this is a test description");
        List<Question> qs = poll.getQuestions();

        Question q = new Question(poll, 1, "Як часто Ви граєте в ігри?", nOfMany);
        qs.add(q);
        List<Metadata> md = q.getMetadata();
        List<Variant> vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Кожен день"));
        vs.add(new Variant(q, 2, "Декілька разів на тиждень"));
        vs.add(new Variant(q, 3, "Декілька разів на місяць"));
        vs.add(new Variant(q, 4, "Декілька разів на рік"));


        q = new Question(poll, 2, "Якому виду ігор ви надаєте перевагу?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "*"));
        md.add(new Metadata(q, "open_answer.index", "6"));

        vs.add(new Variant(q, 1, "Комп'ютерні"));
        vs.add(new Variant(q, 2, "Настільні"));
        vs.add(new Variant(q, 3, "Карткові"));
        vs.add(new Variant(q, 4, "Навчальні"));
        vs.add(new Variant(q, 5, "На відкритому просторі"));
        vs.add(new Variant(q, 6, "Інші (відкрита відповідь)"));


        q = new Question(poll, 3, "Ви граєте в наступні комп'ютерні ігри?", matrix);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "matrix.row_answers.min", "1"));
        md.add(new Metadata(q, "matrix.row_answers.max", "1"));
        md.add(new Metadata(q, "matrix.rows", "10"));
        md.add(new Metadata(q, "matrix.columns", "3"));

        List<Variant> rows = new ArrayList<>();
        List<Variant> columns = new ArrayList<>();

        rows.add(new Variant(q, 1, "Пригоди"));
        rows.add(new Variant(q, 2, "Бойовики"));
        rows.add(new Variant(q, 3, "Загадки"));
        rows.add(new Variant(q, 4, "Логічні"));
        rows.add(new Variant(q, 5, "MMORPG"));
        rows.add(new Variant(q, 6, "RPG"));
        rows.add(new Variant(q, 7, "Ігри-симулятори"));
        rows.add(new Variant(q, 8, "Спортивні"));
        rows.add(new Variant(q, 9, "Стратегії"));
        rows.add(new Variant(q, 10, "Гонки"));

        columns.add(new Variant(q, 11, "Так"));
        columns.add(new Variant(q, 12, "Час від часу"));
        columns.add(new Variant(q, 13, "Ні"));

        addMatrix(q, vs, rows, columns);


        q = new Question(poll, 4, "Як Ви зазвичай отримуєте комп'ютерні ігри?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Купую"));
        vs.add(new Variant(q, 2, "Беру на прокат"));
        vs.add(new Variant(q, 3, "Качаю з інтернету"));


        q = new Question(poll, 5, "Ви граєте на цих пристроях?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "*"));

        vs.add(new Variant(q, 1, "Комп'ютер"));
        vs.add(new Variant(q, 2, "Ноутбук"));
        vs.add(new Variant(q, 3, "Мобільний телефон"));
        vs.add(new Variant(q, 4, "Консоль"));


        q = new Question(poll, 6, "Комп'ютер vs. консоль?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Комп'ютер"));
        vs.add(new Variant(q, 2, "Консоль"));
        vs.add(new Variant(q, 3, "Жоден з варіантів"));


        q = new Question(poll, 7, "PlayStation vs. Xbox?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "PlayStation"));
        vs.add(new Variant(q, 2, "Xbox"));
        vs.add(new Variant(q, 3, "Жоден з варіантів"));


        q = new Question(poll, 8, "Назвіть свою улюблену гру:", open);
        qs.add(q);


        q = new Question(poll, 9, "Яку суму на рік Ви витрачаєте на ігри?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "0 - 500 грн"));
        vs.add(new Variant(q, 2, "501 - 1000 грн"));
        vs.add(new Variant(q, 3, "1 001 - 2 500 грн"));
        vs.add(new Variant(q, 4, "Більше"));


        q = new Question(poll, 10, "Вкажіть вашу стать:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Чоловіча"));
        vs.add(new Variant(q, 2, "Жіноча"));


        return poll;
    }

    private static Poll createCafePoll() {
        Poll poll = new Poll("Оцінка кафе", "bla-bla-bla, this is a test description");
        List<Question> qs = poll.getQuestions();

        Question q = new Question(poll, 1, "Як часто ви відвідуєте кафе?", nOfMany);
        qs.add(q);
        List<Metadata> md = q.getMetadata();
        List<Variant> vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Щодня"));
        vs.add(new Variant(q, 2, "Декілька разів на тиждень"));
        vs.add(new Variant(q, 3, "Раз в тиждень"));
        vs.add(new Variant(q, 4, "Декілька разів на місяць"));
        vs.add(new Variant(q, 5, "Раз в місяць"));
        vs.add(new Variant(q, 6, "Декілька разів на рік"));
        vs.add(new Variant(q, 7, "Вперше"));


        q = new Question(poll, 2, "Зазначте настільки ви згодні з наступними висловлюваннями?", matrix);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "matrix.row_answers.min", "1"));
        md.add(new Metadata(q, "matrix.row_answers.max", "1"));
        md.add(new Metadata(q, "matrix.rows", "5"));
        md.add(new Metadata(q, "matrix.columns", "4"));

        List<Variant> rows = new ArrayList<>();
        List<Variant> columns = new ArrayList<>();

        rows.add(new Variant(q, 1, "Закуски були поданні відмінно"));
        rows.add(new Variant(q, 2, "Закуски були якісні і смачні"));
        rows.add(new Variant(q, 3, "Ціна була приваблива"));
        rows.add(new Variant(q, 4, "Інтер'єр кафе був приємним"));
        rows.add(new Variant(q, 5, "WiFi підключення достатньо швидке і якісне"));

        columns.add(new Variant(q, 6, "Повністю погоджуюсь"));
        columns.add(new Variant(q, 7, "Погоджуюсь"));
        columns.add(new Variant(q, 8, "Непогоджуюсь"));
        columns.add(new Variant(q, 9, "Зовсім непогоджуюсь"));

        addMatrix(q, vs, rows, columns);


        q = new Question(poll, 3, "Відсортуйте від найкращого до найгіршого", sort);
        qs.add(q);
        vs = q.getVariants();

        List<Variant> toSort = new ArrayList<>();
        toSort.add(new Variant(q, 1, "Інтер'єр"));
        toSort.add(new Variant(q, 2, "Обслуговування"));
        toSort.add(new Variant(q, 3, "Смак страв"));
        toSort.add(new Variant(q, 4, "Смак напоїв"));
        toSort.add(new Variant(q, 5, "Чистота у вбиральні"));
        toSort.add(new Variant(q, 6, "Місце розташування закладу"));
        addMatrix(q, vs, toSort, toSort);
//        addMatrix(q, vs, toSort, toSort.stream()
//                .map(v -> new Variant(v.getQuestion(), v.getIndex(), ""))
//                .collect(Collectors.toList()));


        q = new Question(poll, 4, "Оцініть наше кафе", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "1"));
        vs.add(new Variant(q, 2, "2"));
        vs.add(new Variant(q, 3, "3"));
        vs.add(new Variant(q, 4, "4"));
        vs.add(new Variant(q, 5, "5"));


        q = new Question(poll, 5, "Чи порекомендували б ви наше кафе?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Так"));
        vs.add(new Variant(q, 2, "Ні"));


        q = new Question(poll, 6, "Вкажіть вашу стать:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Чоловіча"));
        vs.add(new Variant(q, 2, "Жіноча"));


        q = new Question(poll, 7, "Вкажіть вашу вікову групу:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "<20"));
        vs.add(new Variant(q, 2, "21-30"));
        vs.add(new Variant(q, 3, "31-40"));
        vs.add(new Variant(q, 4, "41-50"));
        vs.add(new Variant(q, 5, "51-60"));
        vs.add(new Variant(q, 6, "60+"));

        return poll;
    }

    private static void addMatrix(Question q, List<Variant> vs, List<Variant> rows, List<Variant> columns) {
        vs.addAll(rows);
        if(columns != rows) {
            vs.addAll(columns);
        }
        for(Variant row : rows) {
            for(Variant column : columns) {
                Variant v = new Variant(q, 0, "");
                row.setLink1(v);
                column.setLink1(v);
                v.setLink1(row);
                v.setLink2(column);
                vs.add(v);
            }
        }
    }
}
