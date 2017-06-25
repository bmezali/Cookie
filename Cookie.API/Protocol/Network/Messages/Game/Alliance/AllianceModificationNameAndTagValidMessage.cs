//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//     Version du runtime :4.0.30319.42000
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cookie.API.Protocol.Network.Messages.Game.Alliance
{
    using System.Collections.Generic;
    using Cookie.API.Protocol.Network.Messages;
    using Cookie.API.Protocol.Network.Types;
    using Cookie.API.IO;
    
    
    public class AllianceModificationNameAndTagValidMessage : NetworkMessage
    {
        
        public const uint ProtocolId = 6449;
        
        public override uint MessageID
        {
            get
            {
                return ProtocolId;
            }
        }
        
        private string m_allianceName;
        
        public virtual string AllianceName
        {
            get
            {
                return m_allianceName;
            }
            set
            {
                m_allianceName = value;
            }
        }
        
        private string m_allianceTag;
        
        public virtual string AllianceTag
        {
            get
            {
                return m_allianceTag;
            }
            set
            {
                m_allianceTag = value;
            }
        }
        
        public AllianceModificationNameAndTagValidMessage(string allianceName, string allianceTag)
        {
            m_allianceName = allianceName;
            m_allianceTag = allianceTag;
        }
        
        public AllianceModificationNameAndTagValidMessage()
        {
        }
        
        public override void Serialize(ICustomDataOutput writer)
        {
            writer.WriteUTF(m_allianceName);
            writer.WriteUTF(m_allianceTag);
        }
        
        public override void Deserialize(ICustomDataInput reader)
        {
            m_allianceName = reader.ReadUTF();
            m_allianceTag = reader.ReadUTF();
        }
    }
}