import 'package:flutter/material.dart';
// import '../services/auth_service.dart';

class LoginEvent extends StatelessWidget {
  LoginEvent({super.key});

  // final AuthService _auth = AuthService();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🌄 IMAGE BACKGROUND
          SizedBox.expand(
            child: Image.network(
              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
              fit: BoxFit.cover,
            ),
          ),

          /// 🌑 OVERLAY DARK
          Container(color: Colors.black.withOpacity(0.6)),

          /// 📱 CONTENU
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// ✨ TEXTE EN HAUT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 80),
                    Text(
                      "Bienvenue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Connecte-toi pour continuer",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),

                /// 🔐 FORMULAIRE EN BAS
                Column(
                  children: [
                    TextField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: password,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🔐 LOGIN
                    ElevatedButton(
                      onPressed: () async {
                        // await _auth.signIn(email.text, password.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text("Connexion"),
                    ),

                    const SizedBox(height: 10),

                    /// 📝 REGISTER
                    ElevatedButton(
                      onPressed: () async {
                        // await _auth.signUp(email.text, password.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text("Créer un compte"),
                    ),

                    const SizedBox(height: 10),

                    /// 🔵 GOOGLE
                    ElevatedButton(
                      onPressed: () async {
                        // await _auth.signInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text("Continuer avec Google"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
