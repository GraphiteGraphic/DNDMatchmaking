using LivingWorldServer.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.DAO
{
    public class FilterSqlDao
    {
        private readonly string connectionString;

        public FilterSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<String> GetFactions()
        {
            List<String> returnFaction = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT name FROM Faction", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string faction = Convert.ToString(reader["name"]);
                            returnFaction.Add(faction);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnFaction;
        }

        public List<String> GetRaces()
        {
            List<String> returnRace = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT name FROM Race", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string race = Convert.ToString(reader["name"]);
                            returnRace.Add(race);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRace;
        }

        public List<String> GetOrigins()
        {
            List<String> returnOrigin = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT name FROM Origin", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string race = Convert.ToString(reader["name"]);
                            returnOrigin.Add(race);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnOrigin;
        }

        public List<String> GetSubOrigins()
        {
            List<String> returnSubOrigin = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT DISTINCT name FROM Sub_Origin", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string suborigin = Convert.ToString(reader["name"]);
                            returnSubOrigin.Add(suborigin);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnSubOrigin;
        }

        public List<SubRace> GetSubRaces()
        {
            List<SubRace> returnSubRace = new List<SubRace>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT s.name AS name, r.name AS race from Sub_Race s
                                                        JOIN Race r ON r.race_id = s.race_id", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            SubRace subrace = new SubRace();
                            subrace.Name = Convert.ToString(reader["name"]);
                            subrace.Race = Convert.ToString(reader["race"]);
                            returnSubRace.Add(subrace);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnSubRace;
        }

        public List<String> GetDeities()
        {
            List<String> returnDeity = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(@"SELECT name FROM Deity", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {
                            string deity = Convert.ToString(reader["name"]);
                            returnDeity.Add(deity);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnDeity;
        }
    }
}
