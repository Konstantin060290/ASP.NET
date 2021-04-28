using System.Data.Entity;

namespace GeekQuiz.Models
{
    public class TriviaDbContext : DbContext
    {
        private static bool _created = false;

        public TriviaDbContext() : base("name=DefaultConnection")
        {
            if (!_created)
            {
                _created = true;
            }
        }

        //protected override void OnModelCreating(DbModelBuilder builder)
        //{
        //    //builder.Entity<TriviaOption>()
        //    //    .HasKey(o => new { o.QuestionId, o.Id });

        //    //builder.Entity<TriviaAnswer>()
        //    //    .HasOptional(a => a.TriviaOption)
        //    //    .WithMany()
        //    //    .HasForeignKey(a => new { a.QuestionId, a.OptionId });

        //    //builder.Entity<TriviaQuestion>()
        //    //    .HasMany(q => q.Options)
        //    //    .WithOptional(o => o.TriviaQuestion);
        //}
        
        public DbSet<TriviaQuestion> TriviaQuestions { get; set; }

        public DbSet<TriviaOption> TriviaOptions { get; set; }

        public DbSet<TriviaAnswer> TriviaAnswers { get; set; }
    }
}
