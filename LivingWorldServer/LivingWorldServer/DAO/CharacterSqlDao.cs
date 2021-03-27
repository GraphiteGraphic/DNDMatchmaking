using LivingWorldServer.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.DAO
{
    public class CharacterSqlDao
    {
        private readonly string connectionString;

        public CharacterSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Character> GetActiveCharacters()
        {
            List<Character> returnCharacter = new List<Character>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand
                        (@"select c.char_id 'id', c.name, r.name AS 'race', sr.name 'subrace', o.name 'origin',
                                so.name 'suborigin', f.name 'faction', d.name 'deity', cl.name 'class', sc.name 'subclass', prestige, mv FROM LW_Character c
                                    JOIN Race r ON c.race_id = r.race_id
                                    LEFT OUTER JOIN Sub_Race sr ON c.sub_race_id = sr.sub_race_id
                                    JOIN Origin o ON c.origin_id = o.origin_id
                                    JOIN Sub_Origin so ON c.sub_origin_id = so.sub_origin_id
                                    LEFT OUTER JOIN Faction f ON c.faction_id = f.faction_id
                                    LEFT OUTER JOIN Deity d ON c.deity_id = d.deity_id
                                    JOIN LW_User u ON c.player_id = u.user_id
                                    JOIN Character_Class cc ON c.char_id = cc.char_id
                                    JOIN Class cl ON cc.class_id = cl.class_id
                                    LEFT OUTER JOIN Sub_Class sc ON cc.sub_class_id = sc.sub_class_id
                                    WHERE u.player_status = 1
                                    	AND c.active = 1", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Character c = new Character();

                            if (reader["subclass"] is DBNull)
                            {
                                c.Subclass = null;
                            }
                            else
                            {
                                c.Subclass = Convert.ToString(reader["subclass"]);
                            }
                            c.Class = Convert.ToString(reader["class"]);
                            c.ID = Convert.ToInt32(reader["id"]);
                            c.Name = Convert.ToString(reader["name"]);
                            c.Race = Convert.ToString(reader["race"]);
                            if (reader["subrace"] is DBNull)
                            {
                                c.Subrace = null;
                            }
                            c.Origin = Convert.ToString(reader["origin"]);
                            c.Suborigin = Convert.ToString(reader["suborigin"]);
                            if (reader["faction"] is DBNull)
                            {
                                c.Faction = null;
                            }
                            else
                            {
                                c.Faction = Convert.ToString(reader["faction"]);
                            }
                            if (reader["deity"] is DBNull)
                            {
                                c.Deity = null;
                            }
                            else
                            {
                                c.Deity = Convert.ToString(reader["deity"]);
                            }
                            c.MV = Convert.ToInt32(reader["mv"]);
                            c.Prestige = Convert.ToInt32(reader["prestige"]);

                            returnCharacter.Add(c);
                        }

                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnCharacter;
        }
    }
}
