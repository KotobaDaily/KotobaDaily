import SwiftUI
import GoogleSignIn

struct GoogleSignInButtonView: View {
    @State private var user: GIDGoogleUser? = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        VStack {
            if let user = user {
                // User is signed in, show their information and a sign-out button
                Text("Welcome, \(user.profile?.name ?? "User")")
                Button(action: signOut) {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.xmark")
                        Text("Sign out")
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            } else {
                // User is not signed in, show the sign-in button
                Button(action: signIn) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                        Text("Sign in with Google")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .onAppear {
            // Update the UI when the view appears
            if GIDSignIn.sharedInstance.currentUser != nil {
                user = GIDSignIn.sharedInstance.currentUser
            }
        }
    }
    
    private func signIn() {
        guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0 is UIWindowScene }) as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("Could not find root view controller.")
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            if let user = signInResult?.user {
                self.user = user
                // Print the user's ID, email, and name
                print("User ID: \(user.userID ?? "No ID")")
                print("User Email: \(user.profile?.email ?? "No Email")")
                print("User Name: \(user.profile?.name ?? "No Name")")
            }
        }
    }
    
    private func signOut() {
        GIDSignIn.sharedInstance.signOut()
        user = nil
        currentUserID = ""
    }
}
