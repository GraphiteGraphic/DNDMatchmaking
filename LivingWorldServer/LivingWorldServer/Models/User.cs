using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.Models
{
    public class User
    {
        public string DiscordTag { get; set; }
        public DateTime LastPlayed { get; set; }
    }
}
