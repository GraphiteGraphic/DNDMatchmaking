using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.Security.Models
{
    /// <summary>
    /// Represents a hashed password.
    /// </summary>
    public class DiscordHash
    {
        /// <summary>
        /// Creates a new hashed password.
        /// </summary>
        /// <param name="discordId">The hashed ID</param>
        /// <param name="salt">The salt used to get the hashed ID.</param>
        public DiscordHash(string discordId, string salt)
        {
            this.Discord_ID = discordId;
            this.Salt = salt;
        }

        /// <summary>
        /// The hashed discord id
        /// </summary>
        public string Discord_ID { get; }

        /// <summary>
        /// The salt used to get the hashed id.
        /// </summary>
        public string Salt { get; }

    }
}

