using LivingWorldServer.Security.Models;
using System;
using System.Security.Cryptography;

namespace LivingWorldServer.Security
{
    /// <summary>
    /// The hash provider provides functionality to hash a plain text password and validate
    /// an existing password against its hash.
    /// </summary>
    public class DiscordHasher : IDiscordHasher
    {
        private const int WorkFactor = 10000;

        /// <summary>
        /// Hashes a plain text discord id.
        /// </summary>
        /// <param name="plainTextID"></param>
        /// <returns></returns>
        public DiscordHash ComputeHash(string plainTextID)
        {
            //Create the hashing provider
            Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(plainTextID, 8, WorkFactor);

            //Get the Hashed Password
            byte[] hash = rfc.GetBytes(20);

            //Set the SaltValue
            string salt = Convert.ToBase64String(rfc.Salt);

            //Return the Hashed Password
            return new DiscordHash(Convert.ToBase64String(hash), salt);
        }

        /// <summary>
        /// Verifies if an existing hashed password matches a plaintext password (+salt).
        /// </summary>
        /// <param name="existingHashedId">The discord id we are comparing to.</param>
        /// <param name="plainTextId">The plaintext id being validated.</param>
        /// <param name="salt">The salt used to get the existing hashed id.</param>
        /// <returns></returns>
        public bool VerifyHashMatch(string existingHashedId, string plainTextId, string salt)
        {
            byte[] saltArray = Convert.FromBase64String(salt);      //gets us the byte[] array representation

            //Create the hashing provider
            Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(plainTextId, saltArray, WorkFactor);

            //Get the hashed password
            byte[] hash = rfc.GetBytes(20);

            //Compare the hashed password values
            string newHashedPassword = Convert.ToBase64String(hash);

            return (existingHashedId == newHashedPassword);
        }
    }
}