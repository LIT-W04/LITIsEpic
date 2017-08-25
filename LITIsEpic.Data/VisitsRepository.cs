using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LITIsEpic.Data
{
    public class VisitsRepository
    {
        private readonly string _connectionString;

        public VisitsRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void AddVisit(string ipAddress)
        {
            Visit visit = new Visit
            {
                IPAddress = ipAddress,
                Date = DateTime.Now
            };
            using (var context = new LITIsEpicDataContext(_connectionString))
            {
                context.Visits.InsertOnSubmit(visit);
                context.SubmitChanges();
            }
        }

        public IEnumerable<GetFiveMostFrequentIPsResult> GetFiveMostFrequentIPs()
        {
            using (var context = new LITIsEpicDataContext(_connectionString))
            {
                return context.GetFiveMostFrequentIPs().ToList();
            }
        }

        public int GetVisitCountForToday()
        {
            using (var context = new LITIsEpicDataContext(_connectionString))
            {
                return context.Visits.Count(v => v.Date.Date == DateTime.Today);
            }
        }

        public string GetMostPopularIpAddress()
        {
            using (var context = new LITIsEpicDataContext(_connectionString))
            {
                return context.GetFiveMostFrequentIPs().First().IPAddress;
            }
        }
    }
}
