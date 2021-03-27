using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.Models
{
    public class Character
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
        public string? Subclass { get; set; }
        public string Race { get; set; }
        public string? Subrace { get; set; }
        public string Origin { get; set; }
        public string Suborigin { get; set; }
        public string? Faction { get; set; }
        public string? Deity { get; set; }
        public int MV { get; set; }
        public int Level { get { return (int)(Math.Sqrt((2.0 * MV) + .25) + .5); } }
        public int Prestige { get; set; }
    }
}
