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

    public class RegisterUser
    {
        public string DiscordTag { get; set; }
        public DateTime LastPlayed { get; set; }
        public string Role { get; set; }
    }

    public class DiscordUser
    {
        public string DiscordID { get; set; }
        public string Username { get; set; }
        public string Discriminator { get; set; }

    }
}
