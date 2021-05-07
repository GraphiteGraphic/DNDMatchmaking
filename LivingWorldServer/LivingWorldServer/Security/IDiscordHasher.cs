using LivingWorldServer.Security.Models;

namespace LivingWorldServer.Security
{
    public interface IDiscordHasher
    {
        /// <summary>
        /// Given a clear text discord id, hash the id and return an ID Hash object.
        /// </summary>
        /// <param name="discord_id">the discord id as given by the user.</param>
        /// <returns>A hashed discord id object.</returns>
        DiscordHash ComputeHash(string discord_id);

        /// <summary>
        /// Verifies a match of an existing hashed password against a user input.
        /// </summary>
        /// <param name="existingHashedTag">The existing hashed discord id.</param>
        /// <param name="discord_id">The discord id sent in by the user</param>
        /// <param name="salt">The salt used to compute the original hash.</param>
        /// <returns></returns>
        bool VerifyHashMatch(string existingHashedTag, string discord_id, string salt);
    }
}
